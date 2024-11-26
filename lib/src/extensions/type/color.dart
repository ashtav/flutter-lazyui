part of '../extension.dart';

/// An extension on the [Color] class that provides additional functionality.
///
/// This extension adds methods for lightening, darkening, inverting, and determining the brightness of colors.
/// The methods leverage Tints utilities for their functionality.
///
/// Example usage:
/// ```dart
/// Color myColor = Color(0xFF123456);
///
/// Color lightenedColor = myColor.lighten(); // lightens the color by 50%
/// Color darkenedColor = myColor.darken(0.7); // darkens the color by 70%
/// Color invertedColor = myColor.inverse(); // inverts the color
/// bool isDark = myColor.isDark(); // returns true if the color is dark
/// ```
///
/// @see [Tints] for the underlying color manipulation functionality.
extension LzColorExtension on Color {
  /// Lightens the color by a given factor.
  ///
  /// @param [mixFactor] The amount by which to lighten the color, represented as a fraction between 0 and 1.
  /// Defaults to 0.5, which lightens the color by 50%.
  /// @return A new [Color] object representing the lightened color.
  Color lighten([double mixFactor = .5]) =>
      Tints.lighten(this, mixFactor: mixFactor);

  /// Darkens the color by a given factor.
  ///
  /// @param [mixFactor] The amount by which to darken the color, represented as a fraction between 0 and 1.
  /// Defaults to 0.5, which darkens the color by 50%.
  /// @return A new [Color] object representing the darkened color.
  Color darken([double mixFactor = .5]) =>
      Tints.darken(this, mixFactor: mixFactor);

  /// Returns the inverted color if [value] is true, otherwise returns the original color.
  ///
  /// If [value] is true, returns a new [Color] object representing the inverted color.
  /// If [value] is false, returns the original [Color] object.
  ///
  /// Example:
  /// ```dart
  /// Color originalColor = Colors.black;
  /// Color invertedColor = originalColor.invert(true); // Inverted color
  /// Color sameColor = originalColor.invert(false); // Original color
  /// ```
  Color invert([bool value = true]) => value ? Tints.inverse(this) : this;

  /// Determines whether the color is considered "dark" based on its luminosity.
  ///
  /// @return A boolean value that is true if the color is dark and false otherwise.
  bool isDark() => Tints.isDark(this);

  /// Adapts the color based on the current application theme.
  ///
  /// Returns the inverse of the color if [lzDarkMode] is `true`, otherwise returns the color itself.
  Color get adaptWithTheme {
    return lzDarkMode ? invert() : this;
  }

  /// check if color is dark or light then return color
  Color get adaptColor {
    return isDark() ? Colors.white : Colors.black87;
  }
}

// extension LzNullableColorExtension on Color? {
//   Color? get adaptWithTheme => this != null && lzDarkMode ? this!.inverse() : this;
// }
