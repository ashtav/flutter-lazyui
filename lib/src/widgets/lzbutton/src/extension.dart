import 'package:flutter/material.dart';

import 'button.dart';
import 'button_style.dart';

extension LzButtonExtension on LzButton {
  LzButton copyWith({LzButtonStyle? style}) {
    return LzButton(
        text: text,
        icon: icon,
        style: LzButtonStyle(
          backgroundColor: style?.backgroundColor,
          textColor: style?.textColor,
          radius: style?.radius,
          width: style?.width,
          outline: style?.outline,
          padding: style?.padding,
        ),
        onTap: onTap);
  }

  LzButton bg(Color backgroundColor, [bool outline = false]) => copyWith(
          style: LzButtonStyle(
        backgroundColor: backgroundColor,
        textColor: style?.textColor,
        radius: style?.radius,
        width: style?.width,
        outline: outline,
        padding: style?.padding,
      ));

  LzButton styled(
          {Color? backgroundColor,
          Color? textColor,
          double? radius,
          double? width,
          bool outline = false,
          EdgeInsetsGeometry? padding}) =>
      copyWith(
          style: LzButtonStyle(
        backgroundColor: backgroundColor,
        textColor: textColor,
        radius: radius,
        width: width,
        outline: outline,
        padding: padding,
      ));

  LzButton sized(double width) => copyWith(style: style?.copyWith(width: width));
}
