part of '../widget.dart';

/// Controller to manage dropdown behavior.
///
/// Use this controller to display the dropdown and manage its state.
class DropController {
  @protected
  late Future<DropValue?> Function() showDropdown;

  void show(void Function(DropValue) then) async {
    await showDropdown().then((value) {
      if (value != null) {
        then(value);
      }
    });
  }
}

/// A dropdown widget that displays a list of options.
///
/// This widget allows customization of the dropdown's content, layout,
/// and behavior.
class LzDropdown extends StatelessWidget {
  /// The list of options available in the dropdown.
  final List<DropOption> options;

  /// A callback triggered when an option is selected.
  final void Function(DropValue)? onSelect;

  /// A builder function for constructing the dropdown and its trigger widget.
  final Widget Function(GlobalKey key, DropController action) builder;

  /// A custom builder function for creating dropdown content.
  final Widget Function(List<DropOption> options)? dropBuilder;

  /// The position of the dropdown relative to the trigger widget.
  final DropPosition? position;

  /// The alignment of the dropdown.
  final DropAlign? align;

  /// The spacing between the dropdown and the trigger widget.
  final Offset? space;

  /// The width of the dropdown.
  final double? width;

  /// The child widget displayed in the dropdown.
  final Widget? child;

  /// Creates an [LzDropdown] instance.
  ///
  /// Example:
  /// ```dart
  /// final options = DropOption.of(['Edit', 'Delete']);
  ///
  /// LzDropdown(
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
  const LzDropdown({
    super.key,
    this.options = const [],
    this.onSelect,
    required this.builder,
    this.dropBuilder,
    this.position,
    this.align,
    this.space,
    this.width,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey();

    // Determine the child widget to use inside the dropdown.
    Widget childOverlay = this.child ?? builder(GlobalKey(), DropController()).lz.ignore();

    // Initialize the dropdown configuration.
    final controller = DropController();

    controller.showDropdown = () {
      return context.dropdown(key,
          options: options,
          onSelect: onSelect,
          space: space,
          position: position,
          align: align,
          overlay: childOverlay,
          dropBuilder: dropBuilder,
          width: width);
    };

    // Build the child widget using the provided builder.
    Widget child = builder(key, controller);

    if (child is DropWrap) {
      child = child.child;
    }

    return child;
  }
}

/// Represents an option for the dropdown widget.
class DropOption {
  /// The label for this dropdown option.
  final String label;

  /// The icon displayed alongside the label, if any.
  final IconData? icon;

  /// Whether the icon is shown as a prefix.
  final bool asPrefix;

  /// Whether this option is visually separated from others.
  final bool separated;

  /// Whether this option is critical, usually shown in a distinctive style.
  final bool critical;

  /// Whether this option is disabled and non-selectable.
  final bool disabled;

  /// Whether this option is focused by default.
  final bool focused;

  /// Constructs a [DropOption] with the provided label and attributes.
  DropOption(
    this.label, {
    this.icon,
    this.asPrefix = false,
    this.separated = false,
    this.critical = false,
    this.disabled = false,
    this.focused = false,
  });

  /// Creates a list of [DropOption]s from a list of strings.
  ///
  /// - [options]: The labels for the dropdown options.
  /// - [icons]: A list of icons for the options, defaulting to an empty list.
  /// - [asPrefix]: Whether all options should display their icon as a prefix.
  /// - [separated], [critical], [disabled], [focused]: Lists to customize attributes for each option
  ///   based on either their index or label.
  static List<DropOption> of(
    List<String> options, {
    List<IconData> icons = const [],
    bool asPrefix = false,
    List separated = const [],
    List critical = const [],
    List disabled = const [],
    List focused = const [],
  }) {
    return options.map((e) {
      bool isContain(List array, dynamic value) {
        return array.map((e) => e.toString().toLowerCase()).contains('$value'.toLowerCase());
      }

      int i = options.indexOf(e);
      bool isSeparated = separated.contains(i) || isContain(separated, e);
      bool isCritical = critical.contains(i) || isContain(critical, e);
      bool isDisabled = disabled.contains(i) || isContain(disabled, e);
      bool isFocus = focused.contains(i) || isContain(focused, e);

      return DropOption(
        e,
        icon: icons.length < i + 1 ? null : icons[i],
        asPrefix: asPrefix,
        separated: isSeparated,
        critical: isCritical,
        disabled: isDisabled,
        focused: isFocus,
      );
    }).toList();
  }
}

/// Represents a selected value from the dropdown.
class DropValue {
  /// The label of the selected option.
  final String label;

  /// The index of the selected option.
  final int index;

  /// Constructs a [DropValue] with the provided label and index.
  DropValue(this.label, this.index);

  @override
  String toString() => 'DropValue($label, $index)';
}

/// Defines the position of the dropdown relative to its triggering widget.
enum DropPosition {
  /// Automatically determines whether the dropdown is shown at the top or bottom.
  auto,

  /// Forces the dropdown to appear above the triggering widget.
  top,

  /// Forces the dropdown to appear below the triggering widget.
  bottom,
}

/// Defines the alignment of the dropdown relative to its triggering widget.
enum DropAlign {
  /// Aligns the dropdown to the left edge of the triggering widget.
  left,

  /// Aligns the dropdown to the right edge of the triggering widget.
  right,
}

/// A wrapper for dropdown content that allows customization of its child widget.
///
/// The [DropWrap] can either return the child widget as-is or pass it through
/// a custom [builder] function for additional transformations.
class DropWrap extends StatelessWidget {
  /// The child widget to be wrapped.
  final Widget child;

  /// An optional builder function to transform the [child].
  final Widget Function(Widget child)? builder;

  /// Creates a [DropWrap] with the provided [child] and optional [builder].
  const DropWrap({
    super.key,
    required this.child,
    this.builder,
  });

  @override
  Widget build(BuildContext context) {
    // If a builder is provided, apply it to the child; otherwise, return the child directly.
    return builder?.call(child) ?? child;
  }
}

/// A widget that represents a dropdown overlay.
///
/// The [_Overlay] is used internally to display dropdown options over the UI.
/// It is positioned relative to a target widget.
class _Overlay extends StatelessWidget {
  /// The target information for positioning the overlay.
  final _Target target;

  /// Optional offset space to add between the overlay and the target widget.
  final Offset? space;

  /// An optional widget that represents the target widget in the overlay.
  final Widget? targetWidget;

  /// The list of dropdown options.
  final List<DropOption> options;

  /// The position of the dropdown relative to the target widget.
  final DropPosition? position;

  /// The alignment of the dropdown relative to the target widget.
  final DropAlign? align;

  /// An optional builder function for customizing how the dropdown options are rendered.
  final Widget Function(List<DropOption> options)? dropBuilder;

  /// The width of the dropdown.
  final double? width;

  /// Creates an [_Overlay] widget with the specified configuration.
  const _Overlay({
    required this.target,
    this.space,
    this.targetWidget,
    this.options = const [],
    this.position,
    this.align,
    this.dropBuilder,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey();
    final notifier = _DropdownNotifier(
      context,
      target,
      key,
      space,
      position ?? DropPosition.auto,
      align ?? DropAlign.left,
    );

    return Stack(
      children: [
        targetWidget is Positioned
            ? (targetWidget as Positioned)
            : Positioned(
                left: target.offset.dx,
                right: context.width - target.size.width - target.offset.dx,
                top: target.offset.dy - context.windowPadding.top,
                child: targetWidget ?? const None(),
              ),
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

                          Color color =
                              option.critical ? Colors.redAccent : (context.isDarkMode ? Colors.white : Colors.black87);

                          List<Widget> children = [
                            Text(option.label, style: Gfont.color(color).fbold(option.focused)),
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
                            color: context.isDarkMode ? darkAppbarColor : backgroundColor,
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
            )),
      ],
    );
  }

  /// Opens the dropdown overlay dialog.
  ///
  /// [context] is the build context where the dialog will be shown.
  /// [key] is the [GlobalKey] of the target widget.
  /// [overlay] is an optional custom widget to use as the target widget.
  /// [options] is a list of dropdown options.
  /// [space] adds optional spacing between the dropdown and the target widget.
  /// [onSelect] is a callback function triggered when an option is selected.
  /// [position] specifies the dropdown's position relative to the target widget.
  /// [align] specifies the dropdown's alignment relative to the target widget.
  /// [dropBuilder] allows customization of dropdown rendering.
  /// [width] specifies the width of the dropdown.
  static Future<DropValue?> open(
    BuildContext context,
    GlobalKey key, {
    Widget? overlay,
    List<DropOption> options = const [],
    Offset? space,
    Function(DropValue)? onSelect,
    DropPosition? position,
    DropAlign? align,
    Widget Function(List<DropOption> options)? dropBuilder,
    double? width,
  }) async {
    try {
      Bindings.onRendered(() async {
        FocusScope.of(context).requestFocus(FocusNode());

        await Future.delayed(Duration(milliseconds: 5)); 

        if (options.isEmpty) {
          logg('Options is empty...', name: 'LzDropdown');
          return null;
        }

        final targetContext = key.context;
        logg(targetContext);

        if (targetContext == null) {
          logg('Target context is undefined.', name: 'LzDropdown');
          return null;
        }

        final box = targetContext.findRenderObject() as RenderBox?;
        final offset = box?.localToGlobal(Offset.zero);

        if (offset != null) {
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
              width: width,
            ),
            backBlur: true,
          )
              .then((value) {
            if (value != null && value is DropValue) {
              onSelect?.call(value);
              return value;
            }

            return null;
          });
        }
      });

      return null;
    } catch (e, s) {
      Print.error('Failed to open dropdown... $e $s');
      return null;
    }
  }
}

/// Extension on [BuildContext] to simplify showing a dropdown.
extension LzDropdownContextExtension on BuildContext {
  /// Opens a dropdown at the specified [key]'s position.
  ///
  /// - [options]: A list of [DropOption] items to show in the dropdown.
  /// - [onSelect]: Callback for when an option is selected.
  /// - [space]: Offset for custom padding adjustments.
  /// - [position]: Preferred position of the dropdown (top, bottom, or auto).
  /// - [align]: Preferred alignment of the dropdown (left or right).
  /// - [overlay]: Optional overlay widget for customization.
  /// - [dropBuilder]: Function to build custom dropdown content.
  /// - [width]: Width of the dropdown.
  ///
  /// Returns a [Future<DropValue?>] containing the selected value or `null`.
  /// ```dart
  /// final key = GlobalKey();
  /// final options = DropOption.of(['Edit', 'Delete']);
  ///
  /// LzButton(
  ///   text: 'Open from Context',
  ///   key: key,
  ///   onTap: () {
  ///     context.dropdown(key, options: options);
  ///   },
  /// )
  /// ```
  Future<DropValue?> dropdown(GlobalKey key,
      {List<DropOption> options = const [],
      void Function(DropValue)? onSelect,
      Offset? space,
      DropPosition? position,
      DropAlign? align,
      Widget? overlay,
      Widget Function(List<DropOption> options)? dropBuilder,
      double? width}) async {
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

/// Class representing a dropdown's target widget's position and size.
class _Target {
  /// Offset of the target widget in global coordinates.
  final Offset offset;

  /// Size of the target widget.
  final Size size;

  /// Creates a [_Target] instance with the given [offset] and [size].
  const _Target(this.offset, this.size);
}

/// A notifier to manage dropdown positioning and visibility.
class _DropdownNotifier extends ChangeNotifier {
  /// The build context of the dropdown.
  final BuildContext context;

  /// The key for the dropdown widget.
  final GlobalKey key;

  /// The target widget's position and size.
  final _Target target;

  /// Custom padding adjustments for the dropdown.
  final Offset? space;

  /// Preferred dropdown position (auto, top, or bottom).
  final DropPosition position;

  /// Preferred dropdown alignment (left or right).
  final DropAlign align;

  /// The calculated dropdown offset.
  Offset offset = Offset.zero;

  /// Visibility of the dropdown.
  bool visible = false;

  /// Initializes the notifier with the given parameters.
  ///
  /// Handles positioning logic for the dropdown based on the target widget,
  /// preferred position, alignment, and screen boundaries.
  _DropdownNotifier(this.context, this.target, this.key, this.space, this.position, this.align) {
    offset = target.offset;

    double dx = offset.dx;
    double dy = offset.dy + target.size.height - context.windowPadding.top;

    Bindings.onRendered(() {
      final box = key.context!.findRenderObject() as RenderBox?;
      final o = box?.localToGlobal(Offset.zero);

      Offset dropdownOffset() {
        return box?.localToGlobal(Offset.zero) ?? Offset.zero;
      }

      Offset dropdown = o ?? Offset.zero;
      Size size = box?.size ?? Size.zero;

      Size screen = Size(context.width, context.height);
      double dropX = 0;

      if (align == DropAlign.right) {
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
        double dropY = dropdownOffset().dy + size.height + context.windowPadding.top + (space?.dy ?? 20);
        double topPosition = dropdown.dy - size.height - (space?.dy ?? 40) - (context.windowPadding.top * 2);
        bool isOutOfY = dropY > screen.height;

        if ([DropPosition.auto, DropPosition.top].contains(position)) {
          if (isOutOfY || position == DropPosition.top) {
            dy = topPosition;
          }
        } else if (position == DropPosition.bottom) {
          dy = dropdown.dy;
        }

        offset = Offset(dx, dy + (space?.dy ?? 20));
        notifyListeners();
      }

      if (position == DropPosition.auto) {
        setUpPosition();

        Bindings.onRendered(() {
          visible = true;
          setUpPosition();
        });

        return;
      }

      Bindings.onRendered(() {
        visible = true;
        setUpPosition();
      });
    });
  }
}
