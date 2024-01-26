import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class FormStyle {
  final Color? background, borderColor;
  final double? radius;
  final IconData? prefixIcon, suffixIcon;
  final Color? prefixIconColor, suffixIconColor, textColor;
  final Widget? prefix;
  final RadioStyle? radio;
  final CheckboxStyle? checkbox;
  final SlideStyle? slide;
  // final bool allInStyle;

  FormStyle(
      {this.background,
      this.borderColor,
      this.radius,
      this.prefixIcon,
      this.suffixIcon,
      this.prefixIconColor,
      this.suffixIconColor,
      this.prefix,
      this.textColor,
      this.radio,
      this.checkbox,
      this.slide,
      // this.allInStyle = false
      });
}
