// ignore_for_file: public_member_api_docs

part of '../widget.dart';

class DropdownController {
  @protected
  final BuildContext? context;
  @protected
  final GlobalKey? key;
  @protected
  final List<LzDropOption>? options;
  @protected
  final Function(LzDropValue)? onSelect;
  @protected
  final Widget? child;

  DropdownController({this.context, this.key, this.options, this.onSelect, this.child});

  void show({Offset? space}) {
    context!.dropdown(key!, options: options!, onSelect: onSelect, space: space, child: child);
  }
}

class LzDropdown extends StatelessWidget {
  final List<LzDropOption> options;
  final Function(LzDropValue)? onSelect;
  final Widget Function(DropdownController action) builder;
  final Widget? child;
  const LzDropdown({super.key, this.options = const [], this.onSelect, required this.builder, this.child});

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey();
    Widget child = this.child ?? builder(DropdownController()).lz.ignore();

    return SizedBox(
        key: key, child: builder(DropdownController(context: context, key: key, options: options, child: child)));
  }

  // create dropdown options
  static List<LzDropOption> of(List<String> options,
      {List<IconData> icons = const [],
      bool asPrefix = false,
      List separated = const [],
      List critical = const [],
      List disabled = const []}) {
    return options.map((e) {
      int i = options.indexOf(e);
      bool isSeparated = separated.contains(i) || separated.contains(e);
      bool isCritical = critical.contains(i) || critical.contains(e);
      bool isDisabled = disabled.contains(i) || disabled.contains(e);

      return LzDropOption(e,
          icon: icons.length < i + 1 ? null : icons[i],
          asPrefix: asPrefix,
          separated: isSeparated,
          critical: isCritical,
          disabled: isDisabled);
    }).toList();
  }
}

class LzDropOption {
  final String label;
  final IconData? icon;
  final bool asPrefix;
  final bool separated;
  final bool critical;
  final bool disabled;

  LzDropOption(this.label,
      {this.icon, this.asPrefix = false, this.separated = false, this.critical = false, this.disabled = false});
}

class LzDropValue {
  final String label;
  final int index;

  LzDropValue(this.label, this.index);

  @override
  String toString() => 'LzDropValue($label, $index})';
}

class _Overlay extends StatelessWidget {
  final _Target target;
  final Offset? space;
  final Widget? targetWidget;
  final List<LzDropOption> options;
  const _Overlay({required this.target, this.space, this.targetWidget, this.options = const []});

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey();
    final notifier = _DropdownNotifier(context, target, key, space);

    return Stack(
      children: [
        // target widget position
        if (targetWidget != null)
          Positioned(
              left: target.offset.dx,
              top: target.offset.dy - context.windowPadding.top,
              right: 20,
              child: SizedBox(
                width: context.width,
                child: targetWidget,
              )),

        // dropdown position
        notifier.watch((state) => Positioned(
              left: notifier.offset.dx,
              top: notifier.offset.dy,
              child: Opacity(
                opacity: state.visible ? 1 : 0,
                child: SizedBox(
                  key: key,
                  width: 250,
                  child: Column(
                    children: options.generate((option, i) {
                      bool asPrefix = option.asPrefix;

                      Color color = option.critical ? Colors.redAccent : Colors.black87;

                      List<Widget> children = [
                        Text(option.label, style: Gfont.color(color)),

                        // if icon is not null
                        if (option.icon != null) Icon(option.icon, color: color)
                      ];

                      if (asPrefix) {
                        children = children.reversed.toList();
                      }

                      return InkTouch(
                        onTap: option.disabled
                            ? null
                            : () {
                                context.lz.pop(LzDropValue(option.label, i));
                              },
                        color: Colors.white,
                        padding: Ei.sym(v: 13, h: 20),
                        border: Br.only(['t'], except: i == 0, width: option.separated ? 3 : .7),
                        child: (asPrefix ? Row(children: children).gap(10) : Row(children: children).between)
                            .lz
                            .opacity(option.disabled ? .5 : 1),
                      );
                    }),
                  ),
                ).lz.clip(all: 7),
              ),
            ))
      ],
    );
  }

  static open(BuildContext context, GlobalKey key,
      {Widget? child, List<LzDropOption> options = const [], Offset? space, Function(LzDropValue)? onSelect}) {
    try {
      if (options.isEmpty) {
        return logg('Options is empty...');
      }

      final box = key.context!.findRenderObject() as RenderBox?;
      final offset = box?.localToGlobal(Offset.zero);

      if (offset != null) {
        context
            .dialog(
                _Overlay(
                    target: _Target(offset, box?.size ?? Size.zero),
                    options: options,
                    space: space,
                    targetWidget: child),
                backBlur: true)
            .then((value) {
          if (value != null) {
            onSelect?.call(value as LzDropValue);
          }
        });
      }
    } catch (e, s) {
      Errors.check(e, s);
    }
  }
}

extension LzDropdownContextExtension on BuildContext {
  void dropdown(GlobalKey key,
      {List<LzDropOption> options = const [], Function(LzDropValue)? onSelect, Offset? space, Widget? child}) {
    _Overlay.open(this, key, options: options, onSelect: onSelect, space: space, child: child);
  }
}

class _Target {
  final Offset offset;
  final Size size;

  _Target(this.offset, this.size);
}

class _DropdownNotifier extends ChangeNotifier {
  final BuildContext context;
  final GlobalKey key;
  final _Target target;
  final Offset? space;

  Offset offset = Offset.zero;
  bool visible = false;

  _DropdownNotifier(this.context, this.target, this.key, this.space) {
    offset = target.offset;

    double dx = offset.dx;
    double dy = offset.dy + target.size.height - context.windowPadding.top;

    // read dropdown size and position
    Bindings.onRendered(() {
      final box = key.context!.findRenderObject() as RenderBox?;
      final o = box?.localToGlobal(Offset.zero);

      // get dropdown position
      Offset dropdownOffset() {
        return box?.localToGlobal(Offset.zero) ?? Offset.zero;
      }

      // dropdown position
      Offset dropdown = o ?? Offset.zero;

      // dropdown size
      Size size = box?.size ?? Size.zero;

      // screen size
      Size screen = Size(context.width, context.height);

      // check if dropdown x position is out of the screen
      double dropX = dropdown.dx + size.width;

      if (dropX > screen.width) {
        dx = screen.width - size.width - (space?.dx ?? 20);
      } else if (dropdown.dx < (space?.dx ?? 20)) {
        dx = 0 + (space?.dx ?? 20);
      }

      void setUpPosition() {
        // check if dropdown y position is out of the screen
        double dropY = dropdownOffset().dy + size.height + context.windowPadding.top + (space?.dy ?? 20);

        if (dropY > screen.height) {
          // dy = target.offset.dy - (size.height + (target.size.height * 2));
          dy = dropdown.dy - size.height - (space?.dy ?? 20) - (context.windowPadding.top * 2);
        }

        offset = Offset(dx, dy + (space?.dy ?? 0));

        notifyListeners();

        if (visible) {
          logg(
              'dropdown pos: ${dropdownOffset()}, dropdown size: $size, screen: $screen, drop-x: $dropX, drop-y: $dropY, target pos: ${target.offset}, target size: ${target.size} final pos: $offset');
        }
      }

      setUpPosition();

      Bindings.onRendered(() {
        visible = true;
        setUpPosition();
      });
    });
  }
}
