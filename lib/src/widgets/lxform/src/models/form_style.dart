import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

/// A class representing the style properties for a form.
class FormStyle {
  /// The background color of the form.
  final Color? background;

  /// The border color of the form.
  final Color? borderColor;

  /// The radius of the form's corners.
  final double? radius;

  /// The icon to be displayed before the input field.
  final IconData? prefixIcon;

  /// The icon to be displayed after the input field.
  final IconData? suffixIcon;

  /// The color of the prefix icon.
  final Color? prefixIconColor;

  /// The color of the suffix icon.
  final Color? suffixIconColor;

  /// The text color of the form.
  final Color? textColor;

  /// The prefix widget to be displayed before the input field.
  final Widget? prefix;

  /// The style properties for radio buttons.
  final RadioStyle? radio;

  /// The style properties for checkboxes.
  final CheckboxStyle? checkbox;

  /// The style properties for slides.
  final SlideStyle? slide;

  /// Constructs a [FormStyle].
  // final bool allInStyle;

  FormStyle({
    this.background,
    this.borderColor,
    this.radius,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixIconColor,
    this.suffixIconColor,
    this.prefix,
    this.textColor,
    this.radio,
    this.checkbox,
    this.slide,
    // this.allInStyle = false
  });
}
