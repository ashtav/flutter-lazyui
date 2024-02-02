import 'package:flutter/material.dart';

class TrainerStyle {
  final String? nextLabel, finishLabel, skipLabel;
  final Color? shadowColor;
  final double? shadowOpacity;
  final bool? backBlur;
  final double? maxHeight;

  const TrainerStyle({
    this.nextLabel,
    this.finishLabel,
    this.skipLabel,
    this.shadowColor,
    this.shadowOpacity,
    this.backBlur,
    this.maxHeight,
  });
}
