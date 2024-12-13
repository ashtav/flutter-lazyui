import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

/// Global variable referencing the default font style from LazyUi.
TextStyle gfont = LazyUi.font;

/// Utility class for applying global font styles.
class Gfont {
  /// Retrieves a styled [TextStyle] based on the provided [context].
  ///
  /// [context]: The build context to access theme data.
  static TextStyle style(BuildContext context) {
    TextStyle? style = Theme.of(context).textTheme.bodyMedium;
    return gfont.copyWith(color: style?.color);
  }

  /// Text style with black color.
  static final TextStyle black = gfont.copyWith(color: Tints.black);

  /// Text style with white color.
  static final TextStyle white = gfont.copyWith(color: Colors.white);

  /// Text style with red color.
  static final TextStyle red = gfont.copyWith(color: Tints.red);

  /// Text style with orange color.
  static final TextStyle orange = gfont.copyWith(color: Tints.orange);

  /// Text style with blue color.
  static final TextStyle blue = gfont.copyWith(color: Tints.blue);

  /// Text style with green color.
  static final TextStyle green = gfont.copyWith(color: Tints.green);

  /// Text style with grey color.
  static final TextStyle grey = gfont.copyWith(color: Tints.grey);

  /// Text style with font size 10.
  static final TextStyle fs10 = gfont.copyWith(fontSize: 10);

  /// Text style with font size 11.
  static final TextStyle fs11 = gfont.copyWith(fontSize: 11);

  /// Text style with font size 12.
  static final TextStyle fs12 = gfont.copyWith(fontSize: 12);

  /// Text style with font size 13.
  static final TextStyle fs13 = gfont.copyWith(fontSize: 13);

  /// Text style with font size 14.
  static final TextStyle fs14 = gfont.copyWith(fontSize: 14);

  /// Text style with font size 15.
  static final TextStyle fs15 = gfont.copyWith(fontSize: 15);

  /// Text style with font size 16.
  static final TextStyle fs16 = gfont.copyWith(fontSize: 16);

  /// Text style with font size 17.
  static final TextStyle fs17 = gfont.copyWith(fontSize: 17);

  /// Text style with font size 18.
  static final TextStyle fs18 = gfont.copyWith(fontSize: 18);

  /// Text style with font size 19.
  static final TextStyle fs19 = gfont.copyWith(fontSize: 19);

  /// Text style with font size 20.
  static final TextStyle fs20 = gfont.copyWith(fontSize: 20);

  /// Text style with bold font weight.
  static final TextStyle bold = gfont.copyWith(fontWeight: FontWeight.bold);

  /// Text style with normal font weight.
  static final TextStyle normal = gfont.copyWith(fontWeight: FontWeight.normal);

  /// Text style with muted color and normal font weight.
  static final TextStyle muted =
      gfont.copyWith(color: Colors.black54.adaptWithTheme);

  /// Returns a text style with the specified [size].
  ///
  /// [size]: The font size.
  static TextStyle fsize(double size) => gfont.copyWith(fontSize: size);

  /// Returns a text style with the specified [color].
  ///
  /// [color]: The text color.
  static TextStyle color(Color color) => gfont.copyWith(color: color);

  /// Returns a text style with bold font weight if [value] is true, otherwise normal font weight.
  ///
  /// [value]: Whether to apply bold font weight.
  static TextStyle fbold(bool value) =>
      gfont.copyWith(fontWeight: value ? FontWeight.bold : FontWeight.normal);
}

/// The `TextStyleExtension` extension provides a set of convenience methods
/// for extending the functionality of the `TextStyle` class in Flutter.
///
/// You can use these extension methods to quickly modify or customize text styles.
///
/// Example:
/// ```dart
/// // Applying the 'bold' extension to a text style
/// Text(
///   'Bold Text',
///   style: myTextStyle.bold,
/// )
/// ```
extension TextStyleExtension on TextStyle {
  /// Creates a copy of the text style with a bold font weight.
  ///
  /// Example:
  /// ```dart
  /// // Applying the 'bold' extension to a text style
  /// Text(
  ///   'Bold Text',
  ///   style: myTextStyle.bold,
  /// )
  /// ```
  TextStyle get bold =>
      copyWith(fontWeight: FontWeight.bold, color: color, fontSize: fontSize);

  /// Creates a copy of the text style with a normal (regular) font weight.
  ///
  /// Example:
  /// ```dart
  /// // Applying the 'normal' extension to a text style
  /// Text(
  ///   'Normal Text',
  ///   style: myTextStyle.normal,
  /// )
  /// ```
  TextStyle get normal => copyWith(fontWeight: FontWeight.normal);

  /// Creates a copy of the text style with a muted color (typically a light gray).
  ///
  /// Example:
  /// ```dart
  /// // Applying the 'muted' extension to a text style
  /// Text(
  ///   'Muted Text',
  ///   style: myTextStyle.muted,
  /// )
  /// ```
  TextStyle get muted => copyWith(color: Colors.black54.adaptWithTheme);

  /// Creates a copy of the text style with a white font color.
  TextStyle get white => copyWith(color: Colors.white);

  /// Creates a copy of the text style with a black font color.
  TextStyle get black => copyWith(color: Tints.black);

  /// Creates a copy of the text style with a red font color.
  TextStyle get red => copyWith(color: Tints.red);

  /// Creates a copy of the text style with an orange font color.
  TextStyle get orange => copyWith(color: Tints.orange);

  /// Creates a copy of the text style with a blue font color.
  TextStyle get blue => copyWith(color: Tints.blue);

  /// Creates a copy of the text style with a green font color.
  TextStyle get green => copyWith(color: Tints.green);

  /// Creates a copy of the text style with a grey font color.
  TextStyle get grey => copyWith(color: Tints.grey);

  /// Creates a copy of the text style with a custom font size.
  ///
  /// Example:
  /// ```dart
  /// // Applying the 'fsize' extension to a text style
  /// Text(
  ///   'Custom Font Size',
  ///   style: myTextStyle.fsize(24),
  /// )
  /// ```
  TextStyle fsize(double size) => copyWith(fontSize: size);

  /// Creates a copy of the text style with a custom font color.
  ///
  /// Example:
  /// ```dart
  /// // Applying the 'fcolor' extension to a text style
  /// Text(
  ///   'Custom Font Color',
  ///   style: myTextStyle.fcolor(Colors.purple),
  /// )
  /// ```
  TextStyle fcolor(Color color) => copyWith(color: color);

  /// Creates a copy of the text style with a custom opacity level.
  ///
  /// Example:
  /// ```dart
  /// // Applying the 'fopacity' extension to a text style
  /// Text(
  ///   'Custom Opacity',
  ///   style: myTextStyle.fopacity(0.7),
  /// )
  /// ```
  TextStyle fopacity(double opacity) =>
      copyWith(color: color?.withValues(alpha: opacity));

  /// Creates a copy of the text style with a custom font weight.
  ///
  /// Example:
  /// ```dart
  /// // Applying the 'fbold' extension to a text style
  /// Text(
  ///   'Bold Text',
  ///   style: myTextStyle.fbold(true),
  /// )
  /// ```
  TextStyle fbold(bool value) =>
      copyWith(fontWeight: value ? FontWeight.bold : FontWeight.normal);

  /// Getter for a TextStyle with font size 10.
  TextStyle get fs10 => copyWith(fontSize: 10);

  /// Getter for a TextStyle with font size 11.
  TextStyle get fs11 => copyWith(fontSize: 11);

  /// Getter for a TextStyle with font size 12.
  TextStyle get fs12 => copyWith(fontSize: 12);

  /// Getter for a TextStyle with font size 13.
  TextStyle get fs13 => copyWith(fontSize: 13);

  /// Getter for a TextStyle with font size 14.
  TextStyle get fs14 => copyWith(fontSize: 14);

  /// Getter for a TextStyle with font size 15.
  TextStyle get fs15 => copyWith(fontSize: 15);

  /// Getter for a TextStyle with font size 16.
  TextStyle get fs16 => copyWith(fontSize: 16);

  /// Getter for a TextStyle with font size 17.
  TextStyle get fs17 => copyWith(fontSize: 17);

  /// Getter for a TextStyle with font size 18.
  TextStyle get fs18 => copyWith(fontSize: 18);

  /// Getter for a TextStyle with font size 19.
  TextStyle get fs19 => copyWith(fontSize: 19);

  /// Getter for a TextStyle with font size 20.
  TextStyle get fs20 => copyWith(fontSize: 20);
}
