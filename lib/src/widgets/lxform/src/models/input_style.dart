import 'package:flutter/material.dart';

/// A class representing the style properties for an input field.
class InputStyle {
  /// The background color of the input field.
  final Color? background;

  /// The border color of the input field.
  final Color? borderColor;

  /// The radius of the input field's corners.
  final double? radius;

  /// The icon to be displayed before the input field.
  final IconData? prefixIcon;

  /// The icon to be displayed after the input field.
  final IconData? suffixIcon;

  /// The color of the prefix icon.
  final Color? prefixIconColor;

  /// The color of the suffix icon.
  final Color? suffixIconColor;

  /// The text color of the input field.
  final Color? textColor;

  /// The prefix widget to be displayed before the input field.
  final Widget? prefix;

  final Widget? suffix;

  /// Constructs an [InputStyle].
  ///
  /// [background] : The background color of the input field.
  ///
  /// [borderColor] : The border color of the input field.
  ///
  /// [radius] : The radius of the input field's corners.
  ///
  /// [prefixIcon] : The icon to be displayed before the input field.
  ///
  /// [suffixIcon] : The icon to be displayed after the input field.
  ///
  /// [prefixIconColor] : The color of the prefix icon.
  ///
  /// [suffixIconColor] : The color of the suffix icon.
  ///
  /// [textColor] : The text color of the input field.
  ///
  /// [prefix] : The prefix widget to be displayed before the input field.
  InputStyle({
    this.background,
    this.borderColor,
    this.radius,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixIconColor,
    this.suffixIconColor,
    this.textColor,
    this.prefix,
    this.suffix
  });
}
