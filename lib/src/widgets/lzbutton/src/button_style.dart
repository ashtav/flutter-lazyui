import 'package:flutter/material.dart';

class LzButtonStyle {
  final Color? backgroundColor;
  final Color? textColor;
  final double? radius;
  final double? width;
  final bool? outline;
  final EdgeInsetsGeometry? padding;

  const LzButtonStyle({this.backgroundColor, this.textColor, this.radius, this.width, this.outline, this.padding});

  LzButtonStyle copyWith(
      {Color? backgroundColor,
      Color? textColor,
      double? radius,
      double? width,
      bool? outline,
      EdgeInsetsGeometry? padding}) {
    return LzButtonStyle(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
      radius: radius ?? this.radius,
      width: width ?? this.width,
      outline: outline ?? this.outline,
      padding: padding ?? this.padding,
    );
  }
}
