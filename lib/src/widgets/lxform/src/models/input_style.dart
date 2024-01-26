import 'package:flutter/material.dart';

class InputStyle {
  final Color? background, borderColor;
  final double? radius;
  final IconData? prefixIcon, suffixIcon;
  final Color? prefixIconColor, suffixIconColor, textColor;
  final Widget? prefix;

  InputStyle(
      {this.background,
      this.borderColor,
      this.radius,
      this.prefixIcon,
      this.suffixIcon,
      this.prefixIconColor,
      this.suffixIconColor,
      this.prefix,
      this.textColor});
}
