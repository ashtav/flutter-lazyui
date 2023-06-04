import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

extension ContextExtension on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
  EdgeInsets get padding => MediaQuery.of(this).padding;
  EdgeInsets get viewPadding => MediaQuery.of(this).viewPadding;
  EdgeInsets get viewInsets => MediaQuery.of(this).viewInsets;
  EdgeInsets get windowPadding =>
      MediaQueryData.fromView(View.of(this)).padding;

  void focus([FocusNode? node]) =>
      FocusScope.of(this).requestFocus(node ?? FocusNode());
  void pop([dynamic result]) => Navigator.pop(this, result);

  Future<T?> push<T extends Object?>(Widget page) =>
      Navigator.push<T>(this, MaterialPageRoute(builder: (_) => page));

  // push replace
  Future<T?> pushAndRemoveUntil<T extends Object?>(Widget page) =>
      Navigator.pushAndRemoveUntil<T>(
          this, MaterialPageRoute(builder: (_) => page), (_) => false);

  // push named
  Future<T?> pushNamed<T extends Object?>(String routeName,
          {Object? arguments}) =>
      Navigator.pushNamed<T>(this, routeName, arguments: arguments);

  // push named replace
  Future<T?> pushNamedAndRemoveUntil<T extends Object?>(String routeName,
          {Object? arguments}) =>
      Navigator.pushNamedAndRemoveUntil<T>(this, routeName, (_) => false,
          arguments: arguments);

  // show dialog
  Future<T?> dialog<T extends Object?>(Widget widget, {bool dismiss = true}) {
    return showDialog<T>(
        context: this, barrierDismissible: dismiss, builder: (_) => widget);
  }

  // show bottom sheet
  Future<T?> bottomSheet<T extends Object?>(Widget widget,
      {bool dismiss = true,
      bool useSafeArea = true,
      bool enableDrag = false,
      Color? backgroundColor,
      bool isScrollControlled = true}) {
    Widget wrapper(Widget child) => Container(
        padding: Ei.only(
            t: useSafeArea
                ? MediaQueryData.fromView(View.of(this)).padding.top
                : 0),
        decoration: BoxDecoration(
            color: backgroundColor ??
                (useSafeArea ? Colors.white : Colors.transparent)),
        child: child);

    return showModalBottomSheet<T>(
        context: this,
        backgroundColor: Colors.transparent,
        isDismissible: dismiss,
        isScrollControlled: isScrollControlled,
        enableDrag: enableDrag,
        builder: ((context) => wrapper(widget)));
  }
}
