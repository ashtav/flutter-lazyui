import 'package:flutter/material.dart';

import 'dropdown_value.dart';

class DropStyle {
  final double? width;
  final Color? background;
  final Color? separatorColor;
  final Color? textColor;
  final Color? barrierColor;
  final List<dynamic> separators;
  final List<IconData?> icons;
  final List<dynamic> criticals;
  final bool transition;
  final DropAlignment? alignment;

  DropStyle(
      {this.width,
      this.background,
      this.separatorColor,
      this.textColor,
      this.barrierColor,
      this.separators = const [],
      this.icons = const [],
      this.criticals = const [],
      this.transition = false,
      this.alignment});
}
