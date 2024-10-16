import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import 'dropdown.dart';

export 'dropdown_option.dart';
export 'dropdown_style.dart';
export 'dropdown_value.dart';

/// Provides functionality to display a dropdown menu.
class LzDrop {
  /// Shows a dropdown menu with the provided options.
  ///
  /// [key] must be either a [BuildContext] or a [GlobalKey].
  /// [options] is a required list of options to display in the dropdown.
  /// [subOptions] is an optional map of sub-options for each option.
  /// [style] allows customizing the dropdown appearance.
  /// [onSelect] is a callback function invoked when an option is selected.
  static void show(dynamic key,
      {required List<String> options,
      Map<String, List<String>>? subOptions,
      DropStyle? style,
      void Function(DropValue value)? onSelect}) {
    if (key is! BuildContext && key is! GlobalKey) {
      return logg(
          'Invalid key provided. Please use either BuildContext or GlobalKey.',
          name: 'LzDrop');
    }

    BuildContext context = key.runtimeType is BuildContext
        ? key
        : (key as GlobalKey).currentContext!;

    final box = context.findRenderObject() as RenderBox?;
    final o = box?.localToGlobal(Offset.zero);
    Offset target = o ?? Offset.zero;

    List<DropOption> dropOptions = options.map((e) {
      List<String> sub = subOptions?[e] ?? [];
      List<DropOption> dropSubOptions = sub.map((f) => DropOption(f)).toList();

      return DropOption(e, subOptions: dropSubOptions);
    }).toList();

    context.dialog(
        Dropdown(
            target: target,
            box: box,
            options: dropOptions,
            style: style,
            onSelect: onSelect),
        barrierColor: style?.barrierColor,
        backBlur: style?.backBlur ?? false,
        blur: 5);
  }
}

/// Abstract class that provides a structure for displaying dropdowns in custom views.
abstract class LzDropView<T> extends StatelessWidget {
  /// Create component
  const LzDropView({super.key});

  /// Displays the dropdown menu in the provided [context].
  ///
  /// [tag] is a unique identifier for the dropdown.
  /// [key] is a [GlobalKey] used to position the dropdown.
  /// [child] is the widget inside the dropdown.
  /// [options] is a list of options to display.
  /// [subOptions] is an optional map of sub-options for each option.
  /// [style] allows customizing the appearance of the dropdown.
  /// [onSelect] is a callback invoked when an option is selected.
  void showDropdown(
      BuildContext context, String tag, GlobalKey key, Widget child,
      {List<String> options = const [],
      Map<String, List<String>>? subOptions,
      DropStyle? style,
      void Function(DropValue value)? onSelect,
      Widget Function(Widget child)? builder}) {
    BuildContext context = key.currentContext!;

    final box = context.findRenderObject() as RenderBox?;
    final o = box?.localToGlobal(Offset.zero);
    Offset target = o ?? Offset.zero;

    double width = (box?.size.width ?? context.width);
    bool isLeftAlign = style?.alignment == DropAlignment.left;

    Widget dropdownWidget = Container(
            color: style?.backgroundColor ?? Colors.transparent,
            constraints: BoxConstraints(maxWidth: width),
            child: child)
        .lz
        .clip(
            tlr: LazyUi.radius,
            bl: isLeftAlign ? 0 : LazyUi.radius,
            br: isLeftAlign ? LazyUi.radius : 0);

    List<DropOption> dropOptions = options.map((e) {
      List<String> sub = subOptions?[e] ?? [];
      List<DropOption> dropSubOptions = sub.map((f) => DropOption(f)).toList();

      return DropOption(e, subOptions: dropSubOptions);
    }).toList();

    context.dialog(
        Dropdown(
            target: target,
            box: box,
            options: dropOptions,
            style: style,
            onSelect: onSelect,
            child: dropdownWidget),
        backBlur: style?.backBlur ?? false,
        barrierColor: style?.barrierColor);
  }

  @override
  Widget build(BuildContext context);
}

/// Widget that displays a dropdown menu with custom options.
class LzDropItem extends LzDropView {
  /// List of main options for the dropdown.
  final List<String> options;

  /// Optional map of sub-options for each main option.
  final Map<String, List<String>>? subOptions;

  /// Style for customizing the dropdown appearance.
  final DropStyle? style;

  /// Builder function for creating the dropdown's child widget.
  final Widget Function(LzDropItemAction action) builder;

  /// Creates an instance of [LzDropItem].
  const LzDropItem(
      {super.key,
      required this.builder,
      this.options = const [],
      this.subOptions,
      this.style});

  @override
  Widget build(BuildContext context) {
    final tag = 'drop-${DateTime.now().millisecondsSinceEpoch}';
    final key = GlobalKey();

    Widget child = builder(LzDropItemAction((_) => {}));

    final action = LzDropItemAction((then) {
      showDropdown(context, tag, key, child,
          options: options,
          subOptions: subOptions,
          style: style,
          onSelect: then);
    });

    return Container(key: key, child: builder(action));
  }
}

/// Action class used to trigger the display of the dropdown.
class LzDropItemAction {
  /// Callback to show the dropdown and handle selection.
  final void Function(Function(DropValue value) select) show;

  /// Create model
  LzDropItemAction(this.show);
}
