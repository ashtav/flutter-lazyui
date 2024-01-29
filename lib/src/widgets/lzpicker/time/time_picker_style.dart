import 'package:flutter/material.dart';

class TimePickerStyle {
  final String? confirmText;
  final bool darkMode;
  final Color? buttonColor;
  final Color? confirmTextColor;
  final Color? textColor;
  final double? radius;

  const TimePickerStyle(
      {this.confirmText, this.darkMode = false, this.buttonColor, this.confirmTextColor, this.textColor, this.radius});
}
