import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
  EdgeInsets get padding => MediaQuery.of(this).padding;
  EdgeInsets get viewPadding => MediaQuery.of(this).viewPadding;
  EdgeInsets get viewInsets => MediaQuery.of(this).viewInsets;

  void focus([FocusNode? node]) => FocusScope.of(this).requestFocus(node ?? FocusNode());
  void pop([dynamic result]) => Navigator.pop(this, result);

  Future<T?> push<T extends Object?>(Widget page) => Navigator.push<T>(this, MaterialPageRoute(builder: (_) => page));

  // show dialog
  void dialog(Widget widget, {bool dismiss = true}) {
    showDialog(context: this, barrierDismissible: dismiss, builder: (_) => widget);
  }

  // show bottom sheet
  void bottomSheet(Widget widget, {bool dismiss = true, Color? backgroundColor, bool isScrollControlled = false}) {
    showModalBottomSheet(
        context: this,
        backgroundColor: backgroundColor ?? Colors.transparent,
        isDismissible: dismiss,
        isScrollControlled: isScrollControlled,
        builder: ((context) => widget));
  }
}
