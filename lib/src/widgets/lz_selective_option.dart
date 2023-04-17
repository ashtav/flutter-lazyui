import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

/// ``` dart
/// LzSelectiveOption.show(context, options: [].options() onSelect: (value) {
///   logg(value.option);
/// });
/// ```

class LzSelectiveOption {
  static void show(
    BuildContext context, {
    String? title,
    IconData? icon,
    Option? initValue,
    required List<Option> options,
    Function(Option)? onSelect,
    Color? activeColor,
    MainAxisAlignment? alignment,
    bool dismissOnSelect = true,
    Widget? suffix,
  }) {
    context.bottomSheet(
        _LzSelectiveOptionWidget(
          context: context,
          title: title,
          icon: icon,
          initValue: initValue,
          options: options,
          onSelect: onSelect,
          activeColor: activeColor,
          alignment: alignment,
          dismissOnSelect: dismissOnSelect,
          suffix: suffix,
        ),
        backgroundColor: Colors.transparent,
        enableDrag: true);
  }
}

class _LzSelectiveOptionWidget extends StatelessWidget {
  final BuildContext context;
  final String? title;
  final IconData? icon;
  final Option? initValue;
  final List<Option> options;
  final Function(Option)? onSelect;
  final Color? activeColor;
  final MainAxisAlignment? alignment;
  final bool dismissOnSelect;
  final Widget? suffix;

  const _LzSelectiveOptionWidget(
      {required this.context,
      this.title,
      this.icon,
      this.initValue,
      required this.options,
      this.onSelect,
      this.activeColor,
      this.alignment,
      this.dismissOnSelect = true,
      this.suffix});

  @override
  Widget build(BuildContext context) {
    List<Option> options = this.options;
    final notifier = LzSelectiveOptionNotifier(options);

    return FutureBuilder(
        future: Future.delayed(300.ms),
        builder: (_, snap) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            int index = options.indexWhere((e) => e.toMap().toString() == initValue?.toMap().toString());
            notifier.toIndex(context, initValue, index);
          });

          if (snap.connectionState == ConnectionState.done) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              int index = options.indexWhere((e) => e.toMap().toString() == initValue?.toMap().toString());
              notifier.onSelect(context, initValue, index);
            });
          }

          return Column(
            mainAxisSize: Mas.min,
            crossAxisAlignment: Caa.start,
            children: [
              if (title != null)
                Textr(
                  title ?? 'Options',
                  style: Gfont.fs20.white.bold,
                  icon: icon ?? La.clipboardList,
                  padding: Ei.all(20),
                ),
              Container(
                decoration: BoxDecoration(color: Colors.white, borderRadius: Br.radiusOnly(tlr: 8)),
                constraints: BoxConstraints(
                  maxHeight: context.height * 0.65,
                ),
                child: AnimatedOpacity(
                  duration: 300.ms,
                  opacity: snap.connectionState == ConnectionState.done ? 1 : 0,
                  child: ListView(
                    physics: BounceScroll(),
                    shrinkWrap: true,
                    controller: notifier.scrollController,
                    children: List.generate(options.length, (i) {
                      final option = options[i];
                      String label = option.option;

                      return notifier.watch((state) {
                        bool isSelected = state.selected?.toMap().toString() == option.toMap().toString();

                        return Opacity(
                          opacity: option.disabled ? .5 : 1,
                          child: Stack(
                            key: state.keys[i],
                            children: [
                              InkW(
                                onTap: option.disabled
                                    ? null
                                    : () {
                                        if (dismissOnSelect) context.pop();
                                        onSelect?.call(option);
                                        state.onSelect(context, option, i, duration: 250.ms);
                                      },
                                padding: Ei.all(22),
                                border: Br.only(['t'], except: i == 0),
                                color: isSelected ? LzColors.lighten(activeColor ?? Colors.blue, mixFactor: .05) : Colors.white,
                                child: Row(
                                  mainAxisAlignment: suffix != null ? Maa.spaceBetween : alignment ?? Maa.start,
                                  children: [
                                    Text(
                                      label,
                                      style: Gfont.color(isSelected ? activeColor ?? Colors.blue : LzColors.black),
                                    ).flexible(),
                                    if (suffix != null)
                                      Container(
                                        margin: Ei.only(l: 15),
                                        child: suffix,
                                      ),
                                  ],
                                ),
                              ),
                              AnimatedPositioned(
                                  duration: 150.ms,
                                  top: 0,
                                  left: isSelected ? 0 : -5,
                                  child: Container(
                                    width: 5,
                                    height: context.height,
                                    decoration: BoxDecoration(color: activeColor ?? Colors.blue),
                                  ))
                            ],
                          ),
                        );
                      });
                    }),
                  ),
                ),
              ).clip(tlr: 8)
            ],
          );
        });
  }
}

class LzSelectiveOptionNotifier extends ChangeNotifier {
  final List<Option> options;

  final scrollController = ScrollController();

  List<GlobalKey> keys = [];
  Option? selected;

  LzSelectiveOptionNotifier(this.options) {
    keys = List.generate(options.length, (i) => GlobalKey());
  }

  void toIndex(BuildContext context, Option? value, int i) {
    if (i < 0) {
      return;
    }

    double fs = Theme.of(context).textTheme.bodyMedium?.fontSize ?? 16.5;
    final text = TextSpan(text: value?.option ?? '');

    final textPainter = TextPainter(text: text, textDirection: TextDirection.ltr);
    textPainter.layout();
    final textWidth = textPainter.width;

    final screenWidth = MediaQuery.of(context).size.width;
    const paddingWidth = 22 * 2; // 22 is the padding of the list item
    final remainingWidth = screenWidth - paddingWidth;
    final rowCount = (textWidth / remainingWidth).ceil();

    final height = (fs + paddingWidth + (fs * rowCount)) - 10.3;

    double to = i * height;
    // logg('-- jump to: $to');

    scrollController.jumpTo(to);
  }

  void onSelect(BuildContext context, Option? value, int i, {Duration? duration}) {
    try {
      selected = value;
      notifyListeners();

      if (i < 0) {
        return;
      }

      Utils.timer(() {
        final k = keys[i];
        final context = k.currentContext;

        if (context != null) {
          Scrollable.ensureVisible(
            context,
            duration: duration ?? 100.ms,
            curve: Curves.linear,
            alignment: 0.5,
          );
        }
      }, 100.ms);
    } catch (e, s) {
      Utils.errorCatcher(e, s);
    }
  }
}
