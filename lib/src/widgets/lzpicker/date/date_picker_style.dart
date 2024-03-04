import 'package:flutter/material.dart';

/// Style configuration for the date picker.
class DatePickerStyle {
  /// Text for the confirm button.
  final String? confirmText;

  /// Determines if the date picker is in dark mode.
  final bool darkMode;

  /// Color of the date picker button.
  final Color? buttonColor;

  /// Color of the confirm button text.
  final Color? confirmTextColor;

  /// Color of the date picker text.
  final Color? textColor;

  /// Radius of the date picker button.
  final double? radius;

  /// Constructs a [DatePickerStyle] with the given configurations.
  const DatePickerStyle({
    this.confirmText,
    this.darkMode = false,
    this.buttonColor,
    this.confirmTextColor,
    this.textColor,
    this.radius,
  });
}
