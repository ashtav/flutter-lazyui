import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

/// Extension providing utility methods for customizing LzButton widgets.
extension LzButtonExtension on LzButton {
  /// Creates a copy of the current LzButton with the provided style.
  ///
  /// [style]: The style to apply to the copied button.
  LzButton copyWith({LzButtonStyle? style}) {
    return LzButton(
        text: text,
        icon: icon,
        style: LzButtonStyle(
          backgroundColor: style?.backgroundColor,
          textColor: style?.textColor,
          borderColor: style?.borderColor,
          textStyle: style?.textStyle,
          radius: style?.radius,
          width: style?.width,
          outline: style?.outline,
          padding: style?.padding,
          shadow: style?.shadow,
          shadowColor: style?.shadowColor,
        ),
        onTap: onTap);
  }

  /// Creates a copy of the current LzButton with the specified background color.
  ///
  /// [backgroundColor]: The background color for the button.
  /// [outline]: Indicates whether the button should have an outline. Default is false.
  LzButton bg(Color backgroundColor, [bool outline = false]) => copyWith(
          style: LzButtonStyle(
        backgroundColor: backgroundColor,
        textColor: style?.textColor,
        borderColor: style?.borderColor,
        textStyle: style?.textStyle,
        radius: style?.radius,
        width: style?.width,
        outline: outline,
        padding: style?.padding,
        shadow: style?.shadow,
        shadowColor: style?.shadowColor,
      ));

  /// Creates a copy of the current LzButton with the specified style properties.
  ///
  /// [backgroundColor]: The background color for the button.
  /// [textColor]: The text color for the button.
  /// [borderColor]: The border color for the button.
  /// [textStyle]: The text style for the button.
  /// [radius]: The border radius for the button.
  /// [width]: The width of the button.
  /// [outline]: Indicates whether the button should have an outline. Default is false.
  /// [padding]: The padding for the button.
  /// [shadow]: Indicates whether the button should have a shadow.
  /// [shadowColor]: The color of the shadow for the button.
  LzButton styled(
          {Color? backgroundColor,
          Color? textColor,
          Color? borderColor,
          TextStyle? textStyle,
          double? radius,
          double? width,
          bool outline = false,
          EdgeInsetsGeometry? padding,
          bool? shadow,
          Color? shadowColor}) =>
      copyWith(
          style: LzButtonStyle(
        backgroundColor: backgroundColor ?? style?.backgroundColor,
        textColor: textColor ?? style?.textColor,
        borderColor: borderColor ?? style?.borderColor,
        textStyle: textStyle ?? style?.textStyle,
        radius: radius ?? style?.radius,
        width: width ?? style?.width,
        outline: outline,
        padding: padding ?? style?.padding,
        shadow: shadow ?? style?.shadow,
        shadowColor: shadowColor ?? style?.shadowColor,
      ));

  /// Creates a copy of the current LzButton with the specified width.
  ///
  /// [width]: The width of the button.
  LzButton sized(double width) {
    return copyWith(
        style: LzButtonStyle(
      backgroundColor: style?.backgroundColor,
      textColor: style?.textColor,
      borderColor: style?.borderColor,
      textStyle: style?.textStyle,
      radius: style?.radius,
      width: width,
      outline: style?.outline,
      padding: style?.padding,
      shadow: style?.shadow,
      shadowColor: style?.shadowColor,
    ));
  }
}
