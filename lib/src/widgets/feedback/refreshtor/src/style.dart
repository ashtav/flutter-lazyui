import 'package:flutter/material.dart';

/// Style configuration for Refreshtor widget.
class RefreshtorStyle {
  /// Text displayed when the indicator is at rest.
  final String? text;

  /// Text displayed when the indicator is released.
  final String? releaseText;

  /// Text color for the indicator.
  final Color? textColor;

  /// Text color for the release state of the indicator.
  final Color? releaseTextColor;

  /// Background color for the indicator.
  final Color? backgroundColor;

  /// Color for the indicator itself.
  final Color? indicatorColor;

  /// Offset at which the indicator transitions to the armed state.
  final double? offsetToArmed;

  /// Height of the indicator.
  final double? height;

  /// Creates a RefreshtorStyle instance.
  const RefreshtorStyle({
    this.text,
    this.releaseText,
    this.textColor,
    this.releaseTextColor,
    this.backgroundColor,
    this.indicatorColor,
    this.offsetToArmed,
    this.height,
  });
}
