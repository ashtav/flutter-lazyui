import 'package:flutter/material.dart';

/// A class representing the style properties for a switch.
class SwitchStyle {
  /// The text color of the switch.
  final Color? textColor;

  /// The color of the switch when it is active.
  final Color? activeColor;

  /// The color of the switch's track.
  final Color? trackColor;

  /// The color of the switch's thumb (the draggable portion).
  final Color? thumbColor;

  /// Constructs a [SwitchStyle].
  ///
  /// [textColor] : The text color of the switch.
  ///
  /// [activeColor] : The color of the switch when it is active.
  ///
  /// [trackColor] : The color of the switch's track.
  ///
  /// [thumbColor] : The color of the switch's thumb (the draggable portion).
  SwitchStyle({
    this.textColor,
    this.activeColor,
    this.trackColor,
    this.thumbColor,
  });
}
