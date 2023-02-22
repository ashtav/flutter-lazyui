import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
  EdgeInsets get padding => MediaQuery.of(this).padding;
  EdgeInsets get viewPadding => MediaQuery.of(this).viewPadding;

  void focus([FocusNode? node]) => FocusScope.of(this).requestFocus(node ?? FocusNode());
  void pop([dynamic result]) => Navigator.pop(this, result);

  Future<T?> push<T extends Object?>(Widget page) => Navigator.push<T>(this, MaterialPageRoute(builder: (_) => page));
}