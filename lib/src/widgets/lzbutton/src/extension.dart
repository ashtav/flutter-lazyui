import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

extension LzButtonExtension on LzButton {
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

  LzButton shadowed([Color? color]) => styled(shadow: true, shadowColor: color ?? 'f1f1f1'.hex);
}
