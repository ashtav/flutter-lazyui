// ignore_for_file: public_member_api_docs

part of '../widget.dart';

class Foo {
  final BuildContext context;
  final GlobalKey key;
  final List<LzDropOption> options;
  final Function(LzDropValue)? onSelect;
  final LzDropPosition? position;
  final LzDropAlign? align;
  final Offset? space;
  final Widget child;

  Foo(this.context, this.key, this.options, this.onSelect, this.position, this.align, this.space, this.child);
}

class DropdownController {
  @protected
  final Foo? data;

  DropdownController({this.data});

  void show() {
    if (data != null) {
      data!.context.dropdown(data!.key,
          options: data!.options,
          onSelect: data!.onSelect,
          space: data!.space,
          position: data!.position,
          align: data!.align,
          overlay: data!.child);
    }
  }
}

class LzDropdown extends StatelessWidget {
  final List<LzDropOption> options;
  final Function(LzDropValue)? onSelect;
  final Widget Function(GlobalKey key, DropdownController action) builder;
  final LzDropPosition? position;
  final LzDropAlign? align;
  final Offset? space;
  final Widget? child;
  const LzDropdown(
      {super.key,
      this.options = const [],
      this.onSelect,
      required this.builder,
      this.position,
      this.align,
      this.space,
      this.child});

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey();
    Widget childOverlay = this.child ?? builder(GlobalKey(), DropdownController()).lz.ignore();
    Widget child = builder(
        key, DropdownController(data: Foo(context, key, options, onSelect, position, align, space, childOverlay)));

    if (child is LzDropWrap) {
      child = child.child;
    }

    return child;
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

enum LzDropPosition { auto, top, bottom }

enum LzDropAlign { left, right }

class LzDropWrap extends StatelessWidget {
  final Widget child;
  final Widget Function(Widget child)? builder;
  const LzDropWrap({super.key, required this.child, this.builder});

  @override
  Widget build(BuildContext context) {
    return builder?.call(child) ?? child;
  }
}

class _Overlay extends StatelessWidget {
  final _Target target;
  final Offset? space;
  final Widget? targetWidget;
  final List<LzDropOption> options;
  final LzDropPosition? position;
  final LzDropAlign? align;
  const _Overlay(
      {required this.target, this.space, this.targetWidget, this.options = const [], this.position, this.align});

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey();
    final notifier =
        _DropdownNotifier(context, target, key, space, position ?? LzDropPosition.auto, align ?? LzDropAlign.left);

    return Stack(
      children: [
        // target widget position
        targetWidget is Positioned
            ? (targetWidget as Positioned)
            : Positioned(
                left: target.offset.dx,
                right: context.width - target.size.width - target.offset.dx,
                top: target.offset.dy - context.windowPadding.top,
                child: targetWidget ?? const None()),

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
      {Widget? overlay,
      List<LzDropOption> options = const [],
      Offset? space,
      Function(LzDropValue)? onSelect,
      LzDropPosition? position,
      LzDropAlign? align}) {
    try {
      if (options.isEmpty) {
        return logg('Options is empty...', name: 'LzDropdown');
      }

      final targetContext = key.context;

      if (targetContext == null) {
        return logg('Target context is undefined.', name: 'LzDropdown');
      }

      final box = targetContext.findRenderObject() as RenderBox?;
      final offset = box?.localToGlobal(Offset.zero);

      if (offset != null) {
        context
            .dialog(
                _Overlay(
                    target: _Target(offset, box?.size ?? Size.zero),
                    options: options,
                    space: space,
                    position: position,
                    align: align,
                    targetWidget: overlay),
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
      {List<LzDropOption> options = const [],
      void Function(LzDropValue)? onSelect,
      Offset? space,
      LzDropPosition? position,
      LzDropAlign? align,
      Widget? overlay}) {
    _Overlay.open(this, key,
        options: options, onSelect: onSelect, space: space, position: position, align: align, overlay: overlay);
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
  final LzDropPosition position;
  final LzDropAlign align;

  Offset offset = Offset.zero;
  bool visible = false;

  _DropdownNotifier(this.context, this.target, this.key, this.space, this.position, this.align) {
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
      double dropX = 0;

      if (align == LzDropAlign.right) {
        // set dropdown alignment
        dx = target.offset.dx - (size.width - target.size.width);

        Bindings.onRendered(() {
          dropX = dropdownOffset().dx + size.width + (space?.dx ?? 20);

          if (dropX > screen.width) {
            dx = screen.width - size.width - (space?.dx ?? 20);
          } else if (dropdownOffset().dx < (space?.dx ?? 20)) {
            dx = (space?.dx ?? 20);
          }

          notifyListeners();
        });
      } else {
        dropX = dropdown.dx + size.width;

        if (dropX > screen.width) {
          dx = screen.width - size.width - (space?.dx ?? 20);
        } else if (dropdown.dx < (space?.dx ?? 20)) {
          dx = 0 + (space?.dx ?? 20);
        }
      }

      void setUpPosition() {
        // check if dropdown y position is out of the screen
        double dropY = dropdownOffset().dy + size.height + context.windowPadding.top + (space?.dy ?? 20);
        double topPosition = dropdown.dy - size.height - (space?.dy ?? 40) - (context.windowPadding.top * 2);
        bool isOutOfY = dropY > screen.height;

        if ([LzDropPosition.auto, LzDropPosition.top].contains(position)) {
          if (isOutOfY || position == LzDropPosition.top) {
            dy = topPosition;
          }
        } else if (position == LzDropPosition.bottom) {
          dy = dropdown.dy;
        }

        offset = Offset(dx, dy + (space?.dy ?? 20));
        notifyListeners();
      }

      // if adjust position is "auto"
      if (position == LzDropPosition.auto) {
        setUpPosition();

        Bindings.onRendered(() {
          visible = true;
          setUpPosition();
        });

        return;
      }

      // if adjust position is always "top"
      Bindings.onRendered(() {
        visible = true;
        setUpPosition();
      });
    });
  }
}
