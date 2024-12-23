part of '../extension.dart';

extension CustomColorExtension on Color {
  Color get themeify {
    return LzTheme.isDarkMode ? Lz.color.invert(this) : this;
  }

  Color get invert {
    return Lz.color.invert(this);
  }

  bool get isDark {
    return computeLuminance() < 0.5;
  }

  /// Lightens the given [color] by [mixFactor].
  ///
  /// [color]: The color to lighten.
  /// [mixFactor]: The factor to mix the color with white (0.0 to 1.0).
  Color lighten([double mixFactor = 0.5]) {
    mixFactor = 1 - mixFactor.clamp(0.0, 1.0);

    double r0 = r * 255;
    double g0 = g * 255;
    double b0 = b * 255;

    int red = (r0 * mixFactor + 255 * (1 - mixFactor)).round();
    int green = (g0 * mixFactor + 255 * (1 - mixFactor)).round();
    int blue = (b0 * mixFactor + 255 * (1 - mixFactor)).round();
    int alpha = (a * 255).toInt();

    return Color.fromARGB(alpha, red, green, blue);
  }

  /// Darkens the given [color] by [mixFactor].
  ///
  /// [color]: The color to darken.
  /// [mixFactor]: The factor to mix the color with black (0.0 to 1.0).
  Color darken([double mixFactor = 0.5]) {
    mixFactor = mixFactor.clamp(0.0, 1.0);

    double r0 = r * 255;
    double g0 = g * 255;
    double b0 = b * 255;

    int red = (r0 * (1 - mixFactor)).round();
    int green = (g0 * (1 - mixFactor)).round();
    int blue = (b0 * (1 - mixFactor)).round();
    int alpha = (a * 255).toInt();

    return Color.fromARGB(alpha, red, green, blue);
  }

  /// Applies the given [opacity] to the color.
  ///
  /// [opacity]: The level of transparency to apply to the color (0.0 to 1.0).
  /// A value of 0.0 means fully transparent, while 1.0 means fully opaque.
  Color applyOpacity([double opacity = 0.5]) {
    return withValues(alpha: opacity);
  }
}
