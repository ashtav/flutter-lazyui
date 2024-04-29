import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lazyui/src/config/lz_config.dart';
import 'package:lazyui/src/constants/color.dart';

TextStyle gfont = LazyUi.font;

/// The `Gfont` class provides a set of predefined text styles and methods for
/// customizing text styles in your application.
///
/// You can use these predefined styles for font color, size, and weight, or create
/// custom text styles by using the provided methods.
///
/// Example:
/// ```dart
/// // Using predefined font color styles
/// Text(
///   'Black Text',
///   style: Gfont.black,
/// )
///
/// // Using custom font size
/// Text(
///   'Custom Font Size',
///   style: Gfont.fs(24),
/// )
/// ```

class Gfont {
  static TextStyle style(BuildContext context) {
    TextStyle? style = Theme.of(context).textTheme.bodyMedium;
    return GoogleFonts.nunitoSans(fontSize: 15.5, color: style?.color);
  }

  // font color
  static final TextStyle black = gfont.copyWith(color: Tints.black);
  static final TextStyle white = gfont.copyWith(color: Colors.white);
  static final TextStyle red = gfont.copyWith(color: Tints.red);
  static final TextStyle orange = gfont.copyWith(color: Tints.orange);
  static final TextStyle blue = gfont.copyWith(color: Tints.blue);
  static final TextStyle green = gfont.copyWith(color: Tints.green);
  static final TextStyle grey = gfont.copyWith(color: Tints.grey);

  // font size
  static final TextStyle fs10 = gfont.copyWith(fontSize: 10);
  static final TextStyle fs11 = gfont.copyWith(fontSize: 11);
  static final TextStyle fs12 = gfont.copyWith(fontSize: 12);
  static final TextStyle fs13 = gfont.copyWith(fontSize: 13);
  static final TextStyle fs14 = gfont.copyWith(fontSize: 14);
  static final TextStyle fs15 = gfont.copyWith(fontSize: 15);
  static final TextStyle fs16 = gfont.copyWith(fontSize: 16);
  static final TextStyle fs17 = gfont.copyWith(fontSize: 17);
  static final TextStyle fs18 = gfont.copyWith(fontSize: 18);
  static final TextStyle fs19 = gfont.copyWith(fontSize: 19);
  static final TextStyle fs20 = gfont.copyWith(fontSize: 20);

  static final TextStyle bold = gfont.copyWith(fontWeight: FontWeight.bold, color: gfont.color);
  static final TextStyle normal = gfont.copyWith(fontWeight: FontWeight.normal);
  static final TextStyle muted = gfont.copyWith(color: (gfont.color ?? Colors.black87).withOpacity(.7));

  /// Creates a custom text style with the specified font size.
  ///
  /// Example:
  /// ```dart
  /// // Creating a custom text style with a font size of 24
  /// Text(
  ///   'Custom Font Size',
  ///   style: Gfont.fs(24),
  /// )
  /// ```

  static TextStyle fs(double size) => gfont.copyWith(fontSize: size);

  /// Creates a custom text style with the specified font color.
  ///
  /// Example:
  /// ```dart
  /// // Creating a custom text style with a custom font color
  /// Text(
  ///   'Custom Font Color',
  ///   style: Gfont.color(Colors.purple),
  /// )
  /// ```

  static TextStyle color(Color color) => gfont.copyWith(color: color);

  /// Creates a custom text style with the specified font weight.
  ///
  /// Example:
  /// ```dart
  /// // Creating a custom text style with bold font weight
  /// Text(
  ///   'Bold Text',
  ///   style: Gfont.fbold(true),
  /// )
  /// ```

  static TextStyle fbold(bool value) => gfont.copyWith(fontWeight: value ? FontWeight.bold : FontWeight.normal);
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
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold, color: color, fontSize: fontSize);

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
  TextStyle get muted => copyWith(color: color?.withOpacity(.6));

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
  TextStyle fopacity(double opacity) => copyWith(color: color?.withOpacity(opacity));

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
  TextStyle fbold(bool value) => copyWith(fontWeight: value ? FontWeight.bold : FontWeight.normal);

  TextStyle get fs10 => copyWith(fontSize: 10);
  TextStyle get fs11 => copyWith(fontSize: 11);
  TextStyle get fs12 => copyWith(fontSize: 12);
  TextStyle get fs13 => copyWith(fontSize: 13);
  TextStyle get fs14 => copyWith(fontSize: 14);
  TextStyle get fs15 => copyWith(fontSize: 15);
  TextStyle get fs16 => copyWith(fontSize: 16);
  TextStyle get fs17 => copyWith(fontSize: 17);
  TextStyle get fs18 => copyWith(fontSize: 18);
  TextStyle get fs19 => copyWith(fontSize: 19);
  TextStyle get fs20 => copyWith(fontSize: 20);
}
