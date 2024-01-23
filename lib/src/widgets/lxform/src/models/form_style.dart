import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class FormStyle {
  final Color? background, borderColor;
  final double? radius;
  final IconData? prefixIcon, suffixIcon;
  final Color? prefixIconColor, suffixIconColor, textColor;
  final RadioStyle? radio;
  // final bool allInStyle;

  FormStyle(
      {this.background,
      this.borderColor,
      this.radius,
      this.prefixIcon,
      this.suffixIcon,
      this.prefixIconColor,
      this.suffixIconColor,
      this.textColor,
      this.radio,
      // this.allInStyle = false
      });
}
