import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

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
  Future<T?> dialog<T extends Object?>(Widget widget, {bool dismiss = true}) {
    return showDialog<T>(context: this, barrierDismissible: dismiss, builder: (_) => widget);
  }

  // show bottom sheet
  Future<T?> bottomSheet<T extends Object?>(Widget widget,
      {bool dismiss = true, bool useSafeArea = true, bool enableDrag = false, Color? backgroundColor, bool isScrollControlled = true}) {
    Widget wrapper(Widget child) => Container(
        padding: Ei.only(t: useSafeArea ? MediaQueryData.fromWindow(window).padding.top : 0),
        decoration: BoxDecoration(color: backgroundColor ?? Colors.white),
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
