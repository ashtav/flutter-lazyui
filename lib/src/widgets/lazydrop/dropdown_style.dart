import 'package:flutter/material.dart';

class DropStyle {
  final double? width;
  final Color? background;
  final Color? separatorColor;
  final Color? textColor;
  final List<dynamic> separators;
  final List<IconData> icons;
  final List<dynamic> criticals;

  DropStyle(
      {this.width,
      this.background,
      this.separatorColor,
      this.textColor,
      this.separators = const [],
      this.icons = const [],
      this.criticals = const []});
}
