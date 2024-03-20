import 'package:flutter/material.dart';

/// A class representing the style properties for a slide (slider).
class SlideStyle {
  /// The text color of the slide.
  final Color? textColor;

  /// The color of the slide when it is active.
  final Color? activeColor;

  /// The color of the slide when it is inactive.
  final Color? inactiveColor;

  /// The color of the slide's thumb (the draggable portion).
  final Color? thumbColor;

  /// The color of the tick marks when the slide is active.
  final Color? activeTickMarkColor;

  /// The color of the tick marks when the slide is inactive.
  final Color? inactiveTickMarkColor;

  /// Constructs a [SlideStyle].
  ///
  /// [textColor] : The text color of the slide.
  ///
  /// [activeColor] : The color of the slide when it is active.
  ///
  /// [inactiveColor] : The color of the slide when it is inactive.
  ///
  /// [thumbColor] : The color of the slide's thumb (the draggable portion).
  ///
  /// [activeTickMarkColor] : The color of the tick marks when the slide is active.
  ///
  /// [inactiveTickMarkColor] : The color of the tick marks when the slide is inactive.
  SlideStyle({
    this.textColor,
    this.activeColor,
    this.inactiveColor,
    this.thumbColor,
    this.activeTickMarkColor,
    this.inactiveTickMarkColor,
  });
}
