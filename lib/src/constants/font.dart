import 'package:flutter/material.dart';
import 'package:lazyui/src/config/config.dart';
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
    return gfont.copyWith(color: style?.color);
  }
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
  TextStyle fopacity(double opacity) =>
      copyWith(color: color?.withOpacity(opacity));

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
