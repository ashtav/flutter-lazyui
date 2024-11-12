import 'package:flutter/material.dart';

/// A class representing the style properties for radio buttons.
class RadioStyle {
  /// The background color of the radio button.
  final Color? background;

  /// The border color of the radio button.
  final Color? borderColor;

  /// The radius of the radio button's corners.
  final double? radius;

  /// The text color of the radio button.
  final Color? textColor;

  /// The color when the radio button is active.
  final Color? activeColor;

  /// The color when the radio button is inactive.
  final Color? inactiveColor;

  /// The color of feedback backdround
  final Color? feedbackBackgroundColor;

  /// Constructs a [RadioStyle].
  ///
  /// [background] : The background color of the radio button.
  ///
  /// [borderColor] : The border color of the radio button.
  ///
  /// [radius] : The radius of the radio button's corners.
  ///
  /// [textColor] : The text color of the radio button.
  ///
  /// [activeColor] : The color when the radio button is active.
  ///
  /// [inactiveColor] : The color when the radio button is inactive.
  RadioStyle(
      {this.background,
      this.borderColor,
      this.radius,
      this.textColor,
      this.activeColor,
      this.inactiveColor,
      this.feedbackBackgroundColor});
}
