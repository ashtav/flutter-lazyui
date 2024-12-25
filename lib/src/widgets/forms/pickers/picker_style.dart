import 'package:flutter/material.dart';

/// Style configuration for the date picker.
class PickerStyle {
  /// Text for the confirm button.
  final String? confirmText;

  /// Color of the date picker button.
  final Color? buttonColor;

  /// Color of the confirm button text.
  final Color? confirmTextColor;

  /// Constructs a [PickerStyle] with the given configurations.
  const PickerStyle({
    this.confirmText,
    this.buttonColor,
    this.confirmTextColor,
  });
}
