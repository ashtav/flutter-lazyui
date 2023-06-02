import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

/// ``` dart
/// LzOption.show(context, options: ['See Detail', 'Edit', 'Delete'].options(icons: icons), confirmOnTap: [2], onSelect: (value) {
///   logg(value.option);
/// });
///
/// // You can set confirmOnTap: [{2: 'Cancel|Delete'}]
/// ```

class LzOption {
  static void show(
    BuildContext context, {
    String? title,
    IconData? icon,
    required List<Option> options,
    List confirmOnTap = const [],
    Function(Option)? onSelect,
    String? cancelLabel,
    MainAxisAlignment? alignment,
    bool showIcon = true,
    bool dismissOnSelect = true,
  }) {
    context.bottomSheet(
        _LzOptionWidget(
          context: context,
          title: title,
          icon: icon,
          options: options,
          confirmOnTap: confirmOnTap,
          onSelect: onSelect,
          cancelLabel: cancelLabel,
          alignment: alignment,
          showIcon: showIcon,
          dismissOnSelect: dismissOnSelect,
        ),
        backgroundColor: Colors.transparent,
        enableDrag: true);
  }
}

class _LzOptionWidget extends StatelessWidget {
  final BuildContext context;
  final String? title;
  final IconData? icon;
  final List<Option> options;
  final List confirmOnTap;
  final Function(Option)? onSelect;
  final String? cancelLabel;
  final MainAxisAlignment? alignment;
  final bool showIcon, dismissOnSelect;

  const _LzOptionWidget(
      {required this.context,
      this.title,
      this.icon,
      required this.options,
      this.confirmOnTap = const [],
      this.onSelect,
      this.cancelLabel,
      this.alignment,
      this.showIcon = true,
      this.dismissOnSelect = true});

  @override
  Widget build(BuildContext context) {
    List<Option> options = [...this.options, Option(option: cancelLabel ?? 'Cancel', icon: La.times)];
    final notifier = LzOptionNotifier();

    return Column(
      mainAxisSize: Mas.min,
      crossAxisAlignment: Caa.start,
      children: [
        Textr(
          title ?? 'Options',
          style: Gfont.fs20.white.bold,
          icon: icon ?? La.clipboardList,
          padding: Ei.all(20),
        ),
        Container(
          decoration: BoxDecoration(color: Colors.white, borderRadius: Br.radiusOnly(tlr: 8)),
          constraints: BoxConstraints(
            maxHeight: context.height * 0.85,
          ),
          child: SingleChildScrollView(
            physics: BounceScroll(),
            padding: Ei.only(b: 15),
            child: Col(
              children: List.generate(options.length, (i) {
                Option option = options[i];
                String label = option.option;
                IconData? icon = option.icon;

                Widget content = Row(
                  mainAxisAlignment: alignment ?? Maa.start,
                  children: [
                    if (icon != null && showIcon)
                      Iconr(
                        icon,
                        margin: Ei.only(r: 15, b: 2),
                      ),
                    Text(
                      label,
                      style: Gfont.bold.muted,
                      overflow: Tof.ellipsis,
                    ).flexible(),
                  ],
                );

                // check confirmOnTap value
                List<int> cotIndex = [];
                String? cotCancelLabel, cotConfirmLabel;

                for (var e in confirmOnTap) {
                  if (e is int) {
                    cotIndex.add(e);
                  } else if (e is Map<int, String>) {
                    cotIndex.add(e.keys.first);
                    List<String> cotLabels = e[e.keys.first]!.split('|');
                    if (cotLabels.length == 2) {
                      cotCancelLabel = cotLabels[0];
                      cotConfirmLabel = cotLabels[1];
                    }
                  }
                }

                return notifier.watch((s) => Opacity(
                      opacity: [-1, i].contains(s.indexFocus) ? 1 : .5,
                      child: InkW(
                          onTap: cotIndex.contains(i) || ![-1, i].contains(s.indexFocus)
                              ? null
                              : () {
                                  if (dismissOnSelect) context.pop();
                                  onSelect?.call(option);
                                },
                          padding: Ei.all(cotIndex.contains(i) ? 0 : 22),
                          border: Br.only(['t'], except: i == 0, width: i == options.length - 1 ? 3 : 1),
                          child: cotIndex.contains(i)
                              ? SwipeAction(
                                  onSwipe: (value) {
                                    notifier.setIndexFocus(value ? i : -1);
                                  },
                                  onTap: (index) {
                                    if (dismissOnSelect) context.pop();
                                    onSelect?.call(option);
                                  },
                                  cotCancelLabel: cotCancelLabel,
                                  cotConfirmLabel: cotConfirmLabel,
                                  child: content,
                                )
                              : content),
                    ));
              }),
            ),
          ),
        ),
      ],
    );
  }
}

class LzOptionNotifier extends ChangeNotifier {
  int indexFocus = -1;

  void setIndexFocus(int index) {
    indexFocus = index;
    notifyListeners();
  }
}

AnimationController? previousController;

class SwipeAction extends StatefulWidget {
  final Widget child;
  final Function(int)? onTap;
  final Function(bool)? onSwipe;
  final String? cotCancelLabel, cotConfirmLabel;

  const SwipeAction({super.key, required this.child, this.onTap, this.onSwipe, this.cotCancelLabel, this.cotConfirmLabel});

  @override
  State<SwipeAction> createState() => _SwipeActionState();
}

class _SwipeActionState extends State<SwipeAction> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 150));
    _animation = Tween(begin: const Offset(0.0, 0.0), end: const Offset(-1, 0.0)).animate(CurveTween(curve: Curves.decelerate).animate(_controller));
  }

  @override
  dispose() {
    previousController?.animateTo(.0);
    previousController = null;

    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SlideTransition(
            position: _animation,
            child: InkW(
              onTap: () {
                _controller.forward();
                widget.onSwipe?.call(true);
              },
              padding: Ei.all(22),
              child: widget.child,
            )),
        Positioned.fill(
          child: LayoutBuilder(
            builder: (context, constraint) {
              return AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Stack(
                    children: <Widget>[
                      Positioned(
                        right: .0,
                        top: .0,
                        bottom: .0,
                        width: constraint.maxWidth * _animation.value.dx * -1,
                        child: Row(
                          children: List.generate(2, (i) {
                            return Expanded(
                              child: Opacity(
                                  opacity: _controller.value > 0 ? 1 : 0,
                                  child: InkW(
                                    onTap: () {
                                      if (i == 0) {
                                        _controller.reverse();
                                        widget.onSwipe?.call(false);
                                      } else {
                                        widget.onTap?.call(i);
                                      }
                                    },
                                    padding: Ei.all(22),
                                    color: i == 0 ? Utils.hex('f9f9f9') : Colors.white,
                                    child: Text(
                                      [widget.cotCancelLabel ?? 'Cancel', widget.cotConfirmLabel ?? 'Confirm'][i],
                                      style: Gfont.bold.muted,
                                      overflow: Tof.ellipsis,
                                    ),
                                  )),
                            );
                          }),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        )
      ],
    );
  }
}
