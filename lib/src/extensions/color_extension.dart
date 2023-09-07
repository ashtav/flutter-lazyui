part of extension;

/// An extension on the [Color] class that provides additional functionality.
///
/// This extension adds methods for lightening, darkening, inverting, and determining the brightness of colors.
/// The methods leverage LzColors utilities for their functionality.
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
/// @see [LzColors] for the underlying color manipulation functionality.
extension LzColorExtension on Color {
  /// Lightens the color by a given factor.
  ///
  /// @param [mixFactor] The amount by which to lighten the color, represented as a fraction between 0 and 1.
  /// Defaults to 0.5, which lightens the color by 50%.
  /// @return A new [Color] object representing the lightened color.
  Color lighten([double mixFactor = .5]) =>
      LzColors.lighten(this, mixFactor: mixFactor);

  /// Darkens the color by a given factor.
  ///
  /// @param [mixFactor] The amount by which to darken the color, represented as a fraction between 0 and 1.
  /// Defaults to 0.5, which darkens the color by 50%.
  /// @return A new [Color] object representing the darkened color.
  Color darken([double mixFactor = .5]) =>
      LzColors.darken(this, mixFactor: mixFactor);

  /// Inverts the color.
  ///
  /// @return A new [Color] object representing the inverted color.
  Color inverse() => LzColors.inverse(this);

  /// Determines whether the color is considered "dark" based on its luminosity.
  ///
  /// @return A boolean value that is true if the color is dark and false otherwise.
  bool isDark() => LzColors.isDark(this);
}
