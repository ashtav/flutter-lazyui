import 'package:flutter/material.dart';

/// Styling options for the TimePicker widget.
class TimePickerStyle {
  /// Text to be displayed on the confirmation button.
  final String? confirmText;

  /// Determines whether the TimePicker should use dark mode.
  final bool darkMode;

  /// Color of the confirmation button.
  final Color? buttonColor;

  /// Color of the confirmation button text.
  final Color? confirmTextColor;

  /// Color of the time picker text.
  final Color? textColor;

  /// Radius of the time picker container.
  final double? radius;

  /// Constructs a [TimePickerStyle] object with the specified style options.
  const TimePickerStyle({
    this.confirmText,
    this.darkMode = false,
    this.buttonColor,
    this.confirmTextColor,
    this.textColor,
    this.radius,
  });
}
