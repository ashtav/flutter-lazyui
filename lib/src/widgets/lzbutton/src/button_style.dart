import 'package:flutter/material.dart';

class LzButtonStyle {
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final TextStyle? textStyle;
  final double? radius;
  final double? width;
  final bool? outline;
  final EdgeInsetsGeometry? padding;
  final bool? shadow;
  final Color? shadowColor;

  const LzButtonStyle(
      {this.backgroundColor,
      this.textColor,
      this.borderColor,
      this.textStyle,
      this.radius,
      this.width,
      this.outline,
      this.padding,
      this.shadow,
      this.shadowColor});

  LzButtonStyle copyWith(
      {Color? backgroundColor,
      Color? textColor,
      Color? borderColor,
      TextStyle? textStyle,
      double? radius,
      double? width,
      bool? outline,
      EdgeInsetsGeometry? padding,
      bool? shadow,
      Color? shadowColor}) {
    return LzButtonStyle(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
      borderColor: borderColor ?? this.borderColor,
      textStyle: textStyle ?? this.textStyle,
      radius: radius ?? this.radius,
      width: width ?? this.width,
      outline: outline ?? this.outline,
      padding: padding ?? this.padding,
      shadow: shadow ?? this.shadow,
      shadowColor: shadowColor ?? this.shadowColor,
    );
  }
}
