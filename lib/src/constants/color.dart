import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import '../utils/util.dart';

/// A utility class for defining and manipulating color tints.
class Tints {
  /// Returns a black color tint.
  static Color get black => Utils.hex('#334155');

  /// Returns a blue color tint.
  static Color get blue => Utils.hex('#60a5fa');

  /// Returns a red color tint.
  static Color get red => Utils.hex('#f87171');

  /// Returns a green color tint.
  static Color get green => Colors.green;

  /// Returns an orange color tint.
  static Color get orange => Utils.hex('#fb923c');

  /// Returns a dark color tint.
  static Color get dark => Utils.hex('#0f172a');

  /// Returns a grey color tint.
  static Color get grey => Utils.hex('#9ca3af');

  /// Lightens the given [color] by [mixFactor].
  ///
  /// [color]: The color to lighten.
  /// [mixFactor]: The factor to mix the color with white (0.0 to 1.0).
  static Color lighten(Color color, {double mixFactor = 0.5}) {
    mixFactor = 1 - mixFactor.clamp(0.0, 1.0);

    double r = color.r * 255;
    double g = color.g * 255;
    double b = color.b * 255;

    int red = (r * mixFactor + 255 * (1 - mixFactor)).round();
    int green = (g * mixFactor + 255 * (1 - mixFactor)).round();
    int blue = (b * mixFactor + 255 * (1 - mixFactor)).round();
    int alpha = (color.a * 255).toInt();

    return Color.fromARGB(alpha, red, green, blue);
  }

  /// Darkens the given [color] by [mixFactor].
  ///
  /// [color]: The color to darken.
  /// [mixFactor]: The factor to mix the color with black (0.0 to 1.0).
  static Color darken(Color color, {double mixFactor = 0.5}) {
    mixFactor = mixFactor.clamp(0.0, 1.0);

    double r = color.r * 255;
    double g = color.g * 255;
    double b = color.b * 255;

    int red = (r * (1 - mixFactor)).round();
    int green = (g * (1 - mixFactor)).round();
    int blue = (b * (1 - mixFactor)).round();
    int alpha = (color.a * 255).toInt();

    return Color.fromARGB(alpha, red, green, blue);
  }

  /// Computes the inverse color of the given [color].
  ///
  /// [color]: The color to invert.
  static Color inverse(Color color) {
    int invertedRed = (255 - (color.r * 255)).toInt();
    int invertedGreen = (255 - (color.g * 255)).toInt();
    int invertedBlue = (255 - (color.b * 255)).toInt();
    int alpha = (color.a * 255).toInt();
    return Color.fromARGB(alpha, invertedRed, invertedGreen, invertedBlue);
  }

  /// Checks if the given [color] is dark.
  ///
  /// [color]: The color to check.
  static bool isDark(Color color) {
    return color.computeLuminance() < 0.5;
  }

  /// Creates a color from the provided hex [code].
  ///
  /// [code]: The hex code representing the color.
  static Color hex(String code) {
    return Utils.hex(code);
  }

  /// Converts the provided [color] into a new [Color] object by blending
  /// it with a white background, effectively removing the transparency.
  ///
  /// The resulting color will look like how the original [color] would appear
  /// on a white background, without any transparency.
  ///
  /// - [color]: The color to be converted, with its transparency blended out.
  ///
  /// Returns a [Color] that represents the original color blended with white.
  static Color colorToHex(Color color) {
    double r = color.r * 255;
    double g = color.g * 255;
    double b = color.b * 255;
    double alpha = color.a * 255;

    // Blend with white background (255, 255, 255)
    int red = ((r * alpha) ~/ 255) + (255 * (255 - alpha) ~/ 255);
    int green = ((g * alpha) ~/ 255) + (255 * (255 - alpha) ~/ 255);
    int blue = ((b * alpha) ~/ 255) + (255 * (255 - alpha) ~/ 255);

    // Return the blended color as a fully opaque color
    return Color.fromARGB(255, red, green, blue);
  }
}
