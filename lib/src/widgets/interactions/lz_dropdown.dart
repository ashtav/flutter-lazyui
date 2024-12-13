part of '../widget.dart';

/// Configuration class for the dropdown widget.
class DropdownConfig {
  /// The [BuildContext] in which the dropdown will be displayed.
  final BuildContext context;

  /// The [GlobalKey] associated with the dropdown widget.
  final GlobalKey key;

  /// A list of [LzDropOption] representing the options available in the dropdown.
  final List<LzDropOption> options;

  /// A callback function that is triggered when an option is selected.
  /// It provides the selected [LzDropValue].
  final Function(LzDropValue)? onSelect;

  /// The position of the dropdown, used to control where the dropdown is shown.
  final LzDropPosition? position;

  /// The alignment of the dropdown relative to the widget that triggers it.
  final LzDropAlign? align;

  /// The offset that controls the space between the dropdown and its triggering widget.
  final Offset? space;

  /// The widget that is displayed as the child of the dropdown.
  final Widget child;

  /// A custom function to build the dropdown content.
  final Widget Function(List<LzDropOption> options)? dropBuilder;

  /// Dropdown width
  final double? width;

  /// Constructor to initialize a [DropdownConfig].
  DropdownConfig(
      this.context,
      this.key,
      this.options,
      this.onSelect,
      this.position,
      this.align,
      this.space,
      this.child,
      this.dropBuilder,
      this.width);
}

/// Controller class that manages the dropdown behavior.
class DropdownController {
  /// The [DropdownConfig] data associated with this controller.
  @protected
  final DropdownConfig? data;

  /// Constructor to initialize a [DropdownController] with optional [DropdownConfig].
  DropdownController({this.data});

  /// Shows the dropdown with the provided configuration.
  Future<LzDropValue?> show() async {
    if (data != null) {
      return data!.context.dropdown(data!.key,
          options: data!.options,
          onSelect: data!.onSelect,
          space: data!.space,
          position: data!.position,
          align: data!.align,
          overlay: data!.child,
          dropBuilder: data!.dropBuilder,
          width: data!.width);
    }

    return null;
  }
}

/// A widget that displays a dropdown menu with customizable options.
class LzDropdown extends StatelessWidget {
  /// A list of [LzDropOption] to be displayed in the dropdown.
  final List<LzDropOption> options;

  /// A callback function triggered when an option is selected.
  final Function(LzDropValue)? onSelect;

  /// A builder function that creates the dropdown trigger widget.
  final Widget Function(GlobalKey key, DropdownController action) builder;

  /// A custom function to build the dropdown content.
  final Widget Function(List<LzDropOption> options)? dropBuilder;

  /// The position of the dropdown relative to the trigger widget.
  final LzDropPosition? position;

  /// The alignment of the dropdown relative to the trigger widget.
  final LzDropAlign? align;

  /// The offset that controls the space between the dropdown and the trigger widget.
  final Offset? space;

  /// Dropdown width
  final double? width;

  /// The widget to display as the dropdown's child.
  final Widget? child;

  /// Constructor to initialize a [LzDropdown] widget.
  const LzDropdown(
      {super.key,
      this.options = const [],
      this.onSelect,
      required this.builder,
      this.dropBuilder,
      this.position,
      this.align,
      this.space,
      this.width,
      this.child});

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey();
    Widget childOverlay =
        this.child ?? builder(GlobalKey(), DropdownController()).lz.ignore();
    Widget child = builder(
        key,
        DropdownController(
            data: DropdownConfig(context, key, options, onSelect, position,
                align, space, childOverlay, dropBuilder, width)));

    if (child is LzDropWrap) {
      child = child.child;
    }

    return child;
  }

  /// Creates a list of [LzDropOption] from a list of option strings.
  /// Additional customization options are provided for icons, separation, critical, and disabled states.
  static List<LzDropOption> of(List<String> options,
      {List<IconData> icons = const [],
      bool asPrefix = false,
      List separated = const [],
      List critical = const [],
      List disabled = const [],
      List focused = const []}) {
    return options.map((e) {
      bool isContain(List array, dynamic value) {
        return array
            .map((e) => e.toString().toLowerCase())
            .contains('$value'.toLowerCase());
      }

      int i = options.indexOf(e);
      bool isSeparated = separated.contains(i) || isContain(separated, e);
      bool isCritical = critical.contains(i) || isContain(critical, e);
      bool isDisabled = disabled.contains(i) || isContain(disabled, e);
      bool isFocus = focused.contains(i) || isContain(focused, e);

      return LzDropOption(e,
          icon: icons.length < i + 1 ? null : icons[i],
          asPrefix: asPrefix,
          separated: isSeparated,
          critical: isCritical,
          disabled: isDisabled,
          focused: isFocus);
    }).toList();
  }
}

/// Represents an option in the dropdown menu.
class LzDropOption {
  /// The label for the option.
  final String label;

  /// An optional icon for the option.
  final IconData? icon;

  /// Whether the icon is displayed as a prefix.
  final bool asPrefix;

  /// Whether the option is separated from others in the dropdown.
  final bool separated;

  /// Whether the option is marked as critical.
  final bool critical;

  /// Whether the option is disabled and cannot be selected.
  final bool disabled;

  /// Whether the option is focused.
  final bool focused;

  /// Constructor to initialize a [LzDropOption].
  LzDropOption(this.label,
      {this.icon,
      this.asPrefix = false,
      this.separated = false,
      this.critical = false,
      this.disabled = false,
      this.focused = false});
}

/// Represents the value of a selected dropdown option.
class LzDropValue {
  /// The label of the selected option.
  final String label;

  /// The index of the selected option in the dropdown list.
  final int index;

  /// Constructor to initialize a [LzDropValue].
  LzDropValue(this.label, this.index);

  @override
  String toString() => 'LzDropValue($label, $index})';
}

/// Enum representing the possible positions of the dropdown relative to the target.
enum LzDropPosition {
  /// Position is automatically determined based on available space.
  auto,

  /// Position the dropdown above the target.
  top,

  /// Position the dropdown below the target.
  bottom
}

/// Enum representing the possible alignments of the dropdown relative to the target.
enum LzDropAlign {
  /// Align the dropdown to the left of the target.
  left,

  /// Align the dropdown to the right of the target.
  right
}

/// A wrapper widget for customizing the display of a child widget.
/// It can apply a custom builder function to the child widget.
class LzDropWrap extends StatelessWidget {
  /// The child widget to be wrapped.
  final Widget child;

  /// A custom function to build the child widget.
  final Widget Function(Widget child)? builder;

  /// Constructor to initialize a [LzDropWrap] widget with a child and optional builder.
  const LzDropWrap({super.key, required this.child, this.builder});

  @override
  Widget build(BuildContext context) {
    // If a builder is provided, apply it to the child, otherwise return the child as is.
    return builder?.call(child) ?? child;
  }
}

/// A widget that displays the dropdown overlay, including positioning, options, and other configurations.
class _Overlay extends StatelessWidget {
  /// The target information (position and size) for where the dropdown should be displayed.
  final _Target target;

  /// The offset space between the dropdown and the target.
  final Offset? space;

  /// The widget to be displayed as the target of the dropdown.
  final Widget? targetWidget;

  /// A list of [LzDropOption] representing the options in the dropdown.
  final List<LzDropOption> options;

  /// The position of the dropdown relative to the target.
  final LzDropPosition? position;

  /// The alignment of the dropdown relative to the target.
  final LzDropAlign? align;

  /// A custom function to build the dropdown options.
  final Widget Function(List<LzDropOption> options)? dropBuilder;

  /// Dropdown width
  final double? width;

  /// Constructor to initialize an [Overlay] widget with required and optional properties.
  const _Overlay(
      {required this.target,
      this.space,
      this.targetWidget,
      this.options = const [],
      this.position,
      this.align,
      this.dropBuilder,
      this.width});

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey();
    final notifier = _DropdownNotifier(context, target, key, space,
        position ?? LzDropPosition.auto, align ?? LzDropAlign.left);

    return Stack(
      children: [
        // Position the target widget based on its offset
        targetWidget is Positioned
            ? (targetWidget as Positioned)
            : Positioned(
                left: target.offset.dx,
                right: context.width - target.size.width - target.offset.dx,
                top: target.offset.dy - context.windowPadding.top,
                child: targetWidget ?? const None()),

        // Position the dropdown options
        notifier.watch((state) => Positioned(
              left: notifier.offset.dx,
              top: notifier.offset.dy,
              child: Opacity(
                key: key,
                opacity: state.visible ? 1 : 0,
                child: dropBuilder?.call(options) ??
                    SizedBox(
                      width: (width ?? 250).clamp(150, context.width),
                      child: Column(
                        children: options.generate((option, i) {
                          bool asPrefix = option.asPrefix;

                          Color color = option.critical
                              ? Colors.redAccent
                              : Colors.black87.adaptWithTheme;

                          List<Widget> children = [
                            Text(option.label,
                                style:
                                    Gfont.color(color).fbold(option.focused)),

                            // If an icon is provided, display it alongside the label
                            if (option.icon != null)
                              Icon(option.icon, color: color)
                          ];

                          if (asPrefix) {
                            children = children.reversed.toList();
                          }

                          return InkTouch(
                            onTap: option.disabled
                                ? null
                                : () {
                                    context.lz
                                        .pop(LzDropValue(option.label, i));
                                  },
                            color: lzBackgroundColor,
                            padding: Ei.sym(v: 13, h: 20),
                            border: Br.only(['t'],
                                except: i == 0,
                                width: option.separated ? 3 : .7),
                            child: (asPrefix
                                    ? Row(children: children).gap(10)
                                    : Row(children: children).between)
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

  /// A method to open the dropdown overlay on the screen.
  /// It handles the position, options, and displays the dropdown.
  static Future<LzDropValue?> open(BuildContext context, GlobalKey key,
      {Widget? overlay,
      List<LzDropOption> options = const [],
      Offset? space,
      Function(LzDropValue)? onSelect,
      LzDropPosition? position,
      LzDropAlign? align,
      Widget Function(List<LzDropOption> options)? dropBuilder,
      double? width}) async {
    try {
      // If no options are provided, log an error.
      if (options.isEmpty) {
        logg('Options is empty...', name: 'LzDropdown');
        return null;
      }

      final targetContext = key.context;

      // Check if the target context is available.
      if (targetContext == null) {
        logg('Target context is undefined.', name: 'LzDropdown');
        return null;
      }

      final box = targetContext.findRenderObject() as RenderBox?;
      final offset = box?.localToGlobal(Offset.zero);

      if (offset != null) {
        // Display the dropdown overlay in the dialog
        return await context
            .dialog(
                _Overlay(
                    target: _Target(offset, box?.size ?? Size.zero),
                    options: options,
                    space: space,
                    position: position,
                    align: align,
                    targetWidget: overlay,
                    dropBuilder: dropBuilder,
                    width: width),
                backBlur: true)
            .then((value) {
          // If an option is selected, call the onSelect callback.
          if (value != null && value is LzDropValue) {
            onSelect?.call(value);
            return value;
          }

          return null;
        });
      }

      return null;
    } catch (e, s) {
      Errors.check(e, s);
      return null;
    }
  }
}

/// Extension on [BuildContext] to open a dropdown menu.
/// This allows calling `context.dropdown()` to open the dropdown with various configurations.
extension LzDropdownContextExtension on BuildContext {
  /// Opens a dropdown overlay with a set of options and configuration.
  ///
  /// Parameters:
  /// - [key]: A [GlobalKey] identifying the target widget for the dropdown.
  /// - [options]: A list of [LzDropOption] representing the items in the dropdown (default is empty).
  /// - [onSelect]: A callback function that gets called when an option is selected.
  /// - [space]: The offset space between the dropdown and the target widget.
  /// - [position]: The position of the dropdown relative to the target widget (default is `auto`).
  /// - [align]: The alignment of the dropdown relative to the target widget (default is `left`).
  /// - [overlay]: An optional widget to display as the overlay instead of the default dropdown.
  /// - [dropBuilder]: A custom builder function to render the dropdown options.
  Future<LzDropValue?> dropdown(GlobalKey key,
      {List<LzDropOption> options = const [],
      void Function(LzDropValue)? onSelect,
      Offset? space,
      LzDropPosition? position,
      LzDropAlign? align,
      Widget? overlay,
      Widget Function(List<LzDropOption> options)? dropBuilder,
      double? width}) async {
    // Opens the dropdown using the provided configurations
    return await _Overlay.open(this, key,
        options: options,
        onSelect: onSelect,
        space: space,
        position: position,
        align: align,
        overlay: overlay,
        dropBuilder: dropBuilder,
        width: width);
  }
}

/// A class representing the position and size of the target widget for the dropdown.
class _Target {
  /// The offset of the target widget (top-left corner).
  final Offset offset;

  /// The size of the target widget.
  final Size size;

  /// Constructor to initialize the target with offset and size.
  _Target(this.offset, this.size);
}

/// A class responsible for calculating and notifying changes in dropdown position.
class _DropdownNotifier extends ChangeNotifier {
  final BuildContext context;
  final GlobalKey key;
  final _Target target;
  final Offset? space;
  final LzDropPosition position;
  final LzDropAlign align;

  Offset offset = Offset.zero;
  bool visible = false;

  _DropdownNotifier(this.context, this.target, this.key, this.space,
      this.position, this.align) {
    offset = target.offset;

    double dx = offset.dx;
    double dy = offset.dy + target.size.height - context.windowPadding.top;

    // Handle dropdown position and visibility when the widget is rendered
    Bindings.onRendered(() {
      final box = key.context!.findRenderObject() as RenderBox?;
      final o = box?.localToGlobal(Offset.zero);

      // Get the position of the dropdown
      Offset dropdownOffset() {
        return box?.localToGlobal(Offset.zero) ?? Offset.zero;
      }

      Offset dropdown = o ?? Offset.zero;
      Size size = box?.size ?? Size.zero;

      // Check if the dropdown position is outside the screen horizontally
      Size screen = Size(context.width, context.height);
      double dropX = 0;

      if (align == LzDropAlign.right) {
        dx = target.offset.dx - (size.width - target.size.width);

        Bindings.onRendered(() {
          dropX = dropdownOffset().dx + size.width + (space?.dx ?? 20);

          // Adjust dropdown position to fit on the screen horizontally
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

      // Set up the dropdown vertical position based on available screen space
      void setUpPosition() {
        double dropY = dropdownOffset().dy +
            size.height +
            context.windowPadding.top +
            (space?.dy ?? 20);
        double topPosition = dropdown.dy -
            size.height -
            (space?.dy ?? 40) -
            (context.windowPadding.top * 2);
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

      // Automatically adjust position if set to "auto"
      if (position == LzDropPosition.auto) {
        setUpPosition();

        Bindings.onRendered(() {
          visible = true;
          setUpPosition();
        });

        return;
      }

      // Always adjust position to top if set
      Bindings.onRendered(() {
        visible = true;
        setUpPosition();
      });
    });
  }
}
