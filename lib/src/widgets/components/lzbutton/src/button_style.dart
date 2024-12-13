import 'package:flutter/material.dart';

/// A class representing the style configuration for a button.
class LzButtonStyle {
  /// The background color of the button.
  final Color? backgroundColor;

  /// The text color of the button.
  final Color? textColor;

  /// The border color of the button.
  final Color? borderColor;

  /// The text style of the button.
  final TextStyle? textStyle;

  /// The radius of the button's corners.
  final double? radius;

  /// The width of the button.
  final double? width;

  /// Whether the button should have an outline.
  final bool? outline;

  /// The padding of the button.
  final EdgeInsetsGeometry? padding;

  /// Whether the button should have a shadow.
  final bool? shadow;

  /// The color of the button's shadow.
  final Color? shadowColor;

  /// Constructs a [LzButtonStyle] instance with the provided parameters.
  const LzButtonStyle({
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.textStyle,
    this.radius,
    this.width,
    this.outline,
    this.padding,
    this.shadow,
    this.shadowColor,
  });

  /// Creates a copy of this style with the specified properties overridden.
  ///
  /// [backgroundColor]: The background color of the button.
  /// [textColor]: The text color of the button.
  /// [borderColor]: The border color of the button.
  /// [textStyle]: The text style of the button.
  /// [radius]: The radius of the button's corners.
  /// [width]: The width of the button.
  /// [outline]: Whether the button should have an outline.
  /// [padding]: The padding of the button.
  /// [shadow]: Whether the button should have a shadow.
  /// [shadowColor]: The color of the button's shadow.
  ///
  /// Returns a new instance of [LzButtonStyle] with the specified properties overridden.
  LzButtonStyle copyWith({
    Color? backgroundColor,
    Color? textColor,
    Color? borderColor,
    TextStyle? textStyle,
    double? radius,
    double? width,
    bool? outline,
    EdgeInsetsGeometry? padding,
    bool? shadow,
    Color? shadowColor,
  }) {
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
