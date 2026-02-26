part of '../widget.dart';

/// A stateless widget that displays a customizable drop-down list.
///
/// The [Droplist] widget allows users to select an item from a list of options.
/// It can be configured with various properties to control its appearance and behavior.
///
/// Typically used in forms or settings screens where a selection from multiple options is required.
class Droplist extends StatelessWidget {
  /// The list of options available in the dropdown.
  final List<DropOption> options;

  /// A callback triggered when an option is selected.
  final void Function(DropValue)? onSelect;

  /// A builder function for constructing the dropdown and its trigger widget.
  final Widget Function(GlobalKey key, DropController action) builder;

  /// The position of the dropdown relative to the trigger widget.
  final DropPosition? position;

  /// The alignment of the dropdown.
  final DropAlign? align;

  /// The spacing between the dropdown and the trigger widget.
  final Offset? space;

  /// The width of the dropdown.
  final double width;

  /// Creates an [Droplist] instance.
  ///
  /// Example:
  /// ```dart
  /// final options = DropOption.of(['Edit', 'Delete']);
  ///
  /// Droplist(
  ///   options: options,
  ///   builder: (key, action) {
  ///     return LzButton(
  ///       key: key,
  ///       text: 'Open!',
  ///       onTap: () {
  ///         action.show().then((value) {
  ///           print(value);
  ///         });
  ///       }
  ///     );
  ///   }
  /// )
  /// ```
  const Droplist({
    super.key,
    this.options = const [],
    this.onSelect,
    required this.builder,
    this.position,
    this.align,
    this.space,
    this.width = 250,
  });

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey();

    // Determine the child widget to use inside the dropdown.
    Widget childOverlay = builder(GlobalKey(), DropController()).lz.ignore();

    // Initialize the dropdown configuration.
    final controller = DropController();

    // Reinit space
    final space = Offset(this.space?.dx ?? 0, this.space?.dy ?? 20);

    controller.showDropdown = () {
      return context.droplist(key, options,
          onSelect: onSelect,
          width: width,
          space: space,
          overlay: childOverlay,
          align: align,
          position: position);
    };

    Widget child = builder(key, controller);

    if (child is DropWrap) {
      child = child.child;
    }

    return child;
  }

  static Future<DropValue?> open(
      BuildContext context, GlobalKey key, List<DropOption> options,
      {double width = 250,
      Offset? space,
      Function(DropValue value)? onSelect,
      Widget? overlay,
      DropAlign? align,
      DropPosition? position}) async {
    context.lz.focus();

    try {
      final targetContext = key.context;

      if (targetContext == null) {
        Print.error('Droplist.open - Target context is undefined.');
        return null;
      }

      final box = targetContext.findRenderObject() as RenderBox?;
      final offset = box?.localToGlobal(Offset.zero) ?? Offset.zero;
      final screen = MediaQuery.of(context).size;

      if (box == null) {
        return Print.error('Droplist.open - Widget render failed.');
      }

      final defaultSpace = 20.0;
      final dxSpace = (space?.dx ?? defaultSpace);

      double dy = offset.dy, dx = offset.dx;

      // prevent drop size more than screen size
      // min = 150, and max = screen width
      width = width.clamp(150, screen.width);

      // set drop align
      if (align == DropAlign.right) {
        dx = dx - (width - box.size.width) - dxSpace;
      } else {
        if ((dx + width + dxSpace) > screen.width) {
          dx = screen.width - width - dxSpace;
        }
      }

      // prevent drop x position more than screen width and less than 0
      if (dx <= dxSpace) {
        dx = dxSpace;
      }

      // logg('dx: $dx, dy: $dy, screen-w: ${screen.width}, screen-h: ${screen.height}');
      DropValue? option = await context
          .dialog(_DroplistWidget(
              options: options,
              offset: Offset(dx, dy),
              space: space,
              width: width,
              target: box,
              targetWidget: overlay,
              position: position))
          .then((value) => value as DropValue?);

      if (option != null) {
        onSelect?.call(option);
      }

      return option;
    } catch (e, s) {
      Print.error('Droplist.open - $e, $s');
      return null;
    }
  }
}

class _DroplistWidget extends StatefulWidget {
  final List<DropOption> options;
  final Offset offset;
  final Offset? space;
  final double width;
  final RenderBox target;
  final Widget? targetWidget;
  final DropPosition? position;

  const _DroplistWidget(
      {this.options = const [],
      required this.offset,
      this.space,
      required this.width,
      required this.target,
      this.targetWidget,
      this.position});

  @override
  State<_DroplistWidget> createState() => __DroplistWidgetState();
}

class __DroplistWidgetState extends State<_DroplistWidget> {
  final key = GlobalKey();
  Offset offset = Offset.zero;
  Offset _target = Offset.zero; // original position of target

  void onInit() {
    try {
      _target = widget.target.localToGlobal(Offset.zero);

      UiFrame.runAfterBuild(() {
        offset = Offset(
            widget.offset.dx, widget.offset.dy - context.windowPadding.top);

        // get target size
        final target = widget.target.size;

        // get space tollerance
        final dySpace = (widget.space?.dy ?? 20.0);

        // check dy position of the drop widget
        final dropBox = key.currentContext?.findRenderObject() as RenderBox?;
        if (dropBox == null) {
          return Print.error(
              '_DroplistWidget.onInit - Dropbox context is undefined.');
        }

        final dropSize = dropBox.size;
        final screen = context.size ?? Size(0, 0);

        // final dropOffset = dropBox.localToGlobal(Offset.zero);
        // logg('target height: ${target.height}, drop-offset: $dropOffset, drop-height: ${dropSize.height}');

        // set drop position
        if (widget.position == DropPosition.bottom) {
          offset = Offset(offset.dx, offset.dy + target.height + dySpace);
        } else {
          if ((offset.dy + dropSize.height + target.height + dySpace >=
                  screen.height) ||
              widget.position == DropPosition.top) {
            offset = Offset(offset.dx, offset.dy - (dropSize.height + dySpace));
          } else {
            offset = Offset(offset.dx, offset.dy + target.height + dySpace);
          }
        }

        setState(() {});
      });
    } catch (e, s) {
      Print.error('_DroplistWidget.onInit - $e, $s');
    }
  }

  @override
  void initState() {
    super.initState();
    onInit();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Prefer to use stack instead clipping (performance reason)
        Positioned(
          left: _target.dx,
          right: context.width - widget.target.size.width - _target.dx,
          top: _target.dy - context.windowPadding.top,
          child: widget.targetWidget ?? const None(),
        ),
        Positioned(
          top: offset.dy,
          left: offset.dx,
          child: SizedBox(
            key: key,
            width: widget.width,
            child: Column(
              children: widget.options.generate((option, i) {
                bool asPrefix = option.asPrefix;

                Color color = option.critical
                    ? Colors.redAccent
                    : (context.isDarkMode ? Colors.white : Colors.black87);

                List<Widget> children = [
                  Text(option.label, style: Gfont.color(color)),
                  if (option.icon != null) Icon(option.icon, color: color),
                ];

                if (asPrefix) {
                  children = children.reversed.toList();
                }

                return InkTouch(
                  onTap: option.disabled
                      ? null
                      : () {
                          context.lz.pop(DropValue(option.label, i));
                        },
                  color: (context.isDarkMode
                          ? darkAppbarColor
                          : backgroundColor)
                      .darken(
                          option.focused ? (context.isDarkMode ? .2 : .1) : 0),
                  padding: Ei.sym(v: 13, h: 20),
                  border: Br.only(['t'],
                      except: i == 0, width: option.separated ? 3 : .7),
                  child: (asPrefix
                          ? Row(children: children).gap(10)
                          : Row(children: children).between)
                      .lz
                      .opacity(option.disabled ? .5 : 1),
                );
              }),
            ).lz.clip(all: config.borderRadius),
          ),
        ),
      ],
    );
  }
}

extension DroplistExtension on BuildContext {
  Future<DropValue?> droplist(GlobalKey key, List<DropOption> options,
      {double width = 250,
      Offset? space,
      Function(DropValue value)? onSelect,
      Widget? overlay,
      DropAlign? align,
      DropPosition? position}) async {
    return await Droplist.open(this, key, options,
        width: width,
        space: space,
        onSelect: onSelect,
        overlay: overlay,
        align: align,
        position: position);
  }
}
