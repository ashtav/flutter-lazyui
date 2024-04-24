import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import 'dropdown.dart';

export 'dropdown_option.dart';
export 'dropdown_style.dart';
export 'dropdown_value.dart';

/// A utility class for displaying dropdown menus.
class LzDrop {
  /// Displays a dropdown menu.
  ///
  /// Parameters:
  /// - `key`: The global key associated with the dropdown.
  /// - `options`: A list of options to be displayed in the dropdown menu.
  /// - `style`: The style configuration for the dropdown menu.
  /// - `onSelect`: A callback function invoked when an option is selected.
  static void show(GlobalKey key,
      {List<DropOption> options = const [],
      DropStyle? style,
      void Function(DropValue value)? onSelect}) {
    try {
      // only accept GlobalKey or BuildContext
      if ([BuildContext, GlobalKey].contains(key.runtimeType)) {
        return logg('Context is invalid!', name: 'LzDrop');
      } else if (key.currentContext == null) {
        return logg(
            'GlobalKey is not attached to any widget. Make sure you have added the GlobalKey to a widget that has been built.',
            name: 'LzDrop');
      }

      BuildContext context = key.currentContext!;

      // render box of the target
      final box = context.findRenderObject() as RenderBox?;
      final o = box?.localToGlobal(Offset.zero);
      Offset target = o ?? Offset.zero;

      // show dropdown
      context.dialog(
          Dropdown(
              target: target,
              box: box,
              options: options,
              style: style,
              onSelect: onSelect),
          barrierColor: style?.barrierColor,
          backBlur: style?.backBlur ?? false,
          blur: 5);
    } catch (e, s) {
      Utils.errorCatcher(e, s);
    }
  }
}

/// An abstract class for creating dropdown view widgets.
abstract class LzDropView<T> extends StatelessWidget {
  const LzDropView({Key? key}) : super(key: key);

  /// Displays a dropdown menu.
  ///
  /// Parameters:
  /// - `context`: The build context.
  /// - `tag`: A unique identifier for the dropdown.
  /// - `key`: The global key associated with the dropdown.
  /// - `child`: The child widget that triggers the dropdown.
  /// - `options`: A list of options to be displayed in the dropdown menu.
  /// - `style`: The style configuration for the dropdown menu.
  /// - `onSelect`: A callback function invoked when an option is selected.
  void showDropdown(
      BuildContext context, String tag, GlobalKey key, Widget child,
      {List<DropOption> options = const [],
      DropStyle? style,
      void Function(DropValue value)? onSelect}) {
    BuildContext context = key.currentContext!;

    // render box of the target
    final box = context.findRenderObject() as RenderBox?;
    final o = box?.localToGlobal(Offset.zero);
    Offset target = o ?? Offset.zero;

    double width = (box?.size.width ?? context.width);
    bool isLeftAlign = style?.alignment == DropAlignment.left;

    // Navigator.of(context).push(PageRouteBuilder(
    //     opaque: false,
    //     barrierDismissible: true,
    //     barrierColor: Colors.black.withOpacity(0.2),
    //     pageBuilder: (BuildContext context, _, __) {
    //       // convert dy to 0 - 1
    //       // double dy = target.dy / context.height;

    //       Widget blurWrapper(Widget child) =>
    //           BackdropFilter(filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5), child: child);

    //       // Hero(
    //       // tag: tag,
    //       // flightShuttleBuilder: (context, animation, direction, fromContext, toContext) {
    //       //   final position = Tween<Offset>(begin: Offset(0, dy - .1), end: Offset(0, dy)).animate(animation);

    //       //   return SlideTransition(
    //       //     position: position,
    //       //     child: child,
    //       //   );
    //       // })

    //       return blurWrapper(Dropdown(
    //           target: target,
    //           box: box,
    //           options: options,
    //           style: style,
    //           onSelect: onSelect,
    //           child: Container(color: Colors.white, constraints: BoxConstraints(maxWidth: width), child: child)
    //               .lz
    //               .clip(tlr: LazyUi.radius, bl: isLeftAlign ? 0 : LazyUi.radius, br: isLeftAlign ? LazyUi.radius : 0)));
    //     }));

    context.dialog(
        Dropdown(
            target: target,
            box: box,
            options: options,
            style: style,
            onSelect: onSelect,
            child: Container(
                    color: Colors.white,
                    constraints: BoxConstraints(maxWidth: width),
                    child: child)
                .lz
                .clip(
                    tlr: LazyUi.radius,
                    bl: isLeftAlign ? 0 : LazyUi.radius,
                    br: isLeftAlign ? LazyUi.radius : 0)),
        backBlur: style?.backBlur ?? false,
        barrierColor: style?.barrierColor);
  }

  @override
  Widget build(BuildContext context);
}

/// A dropdown item widget that displays a list of options when tapped.
class LzDropItem extends LzDropView {
  /// The child widget to be displayed as the dropdown item.
  final Widget child;

  /// The list of options to be displayed in the dropdown menu.
  final List<DropOption> options;

  /// The style configuration for the dropdown menu.
  final DropStyle? style;

  /// A callback function invoked when an option is selected.
  final void Function(DropValue value)? onSelect;

  const LzDropItem(
      {super.key,
      required this.child,
      this.options = const [],
      this.style,
      this.onSelect});

  @override
  Widget build(BuildContext context) {
    final tag = 'drop-${DateTime.now().millisecondsSinceEpoch}';
    final key = GlobalKey();

    return Touch(
        key: key,
        onTap: () {
          showDropdown(context, tag, key, child,
              options: options, style: style, onSelect: onSelect);
        },
        child: child);
  }

  // flightShuttleBuilder: (context, animation, direction, fromContext, toContext) {
  //   final position = Tween<Offset>(begin: const Offset(0, 0), end: const Offset(0, 1)).animate(animation);

  //   return SlideTransition(
  //     position: position,
  //     child: child,
  //   );

  //   // final customAnimation = Tween<double>(begin: 0, end: 2).animate(animation);

  //   // return AnimatedBuilder(
  //   //     animation: customAnimation,
  //   //     builder: (context, child) {
  //   //       return Transform(
  //   //           transform: Matrix4.identity()
  //   //             ..setEntry(3, 2, .003)
  //   //             ..rotateX(customAnimation.value * pi),
  //   //           alignment: Alignment.center,
  //   //           child: child);
  //   //     });
  // },
}
