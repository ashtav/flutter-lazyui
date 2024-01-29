import 'package:flutter/material.dart';

import 'enum.dart';

class DatePickerStyle {
  final String? confirmText;
  final DatePickerType type;
  final bool darkMode;
  final Color backgroundColor;
  final Color textColor;
  final double? radius;

  const DatePickerStyle(
      {this.confirmText,
      this.type = DatePickerType.all,
      this.darkMode = false,
      this.backgroundColor = Colors.white,
      this.textColor = Colors.black,
      this.radius});
}
