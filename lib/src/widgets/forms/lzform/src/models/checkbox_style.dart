import 'package:flutter/material.dart';

/// A class representing the style properties for checkboxes.
class CheckboxStyle {
  /// The background color of the checkbox.
  final Color? background;

  /// The border color of the checkbox.
  final Color? borderColor;

  /// The radius of the checkbox corners.
  final double? radius;

  /// The text color of the checkbox.
  final Color? textColor;

  /// The color when the checkbox is active.
  final Color? activeColor;

  /// The color when the checkbox is inactive.
  final Color? inactiveColor;

  /// The color of feedback backdround
  final Color? feedbackBackgroundColor;

  /// Constructs a [CheckboxStyle].
  ///
  /// [background] : The background color of the checkbox.
  ///
  /// [borderColor] : The border color of the checkbox.
  ///
  /// [radius] : The radius of the checkbox corners.
  ///
  /// [textColor] : The text color of the checkbox.
  ///
  /// [activeColor] : The color when the checkbox is active.
  ///
  /// [inactiveColor] : The color when the checkbox is inactive.
  CheckboxStyle(
      {this.background,
      this.borderColor,
      this.radius,
      this.textColor,
      this.activeColor,
      this.inactiveColor,
      this.feedbackBackgroundColor});
}
