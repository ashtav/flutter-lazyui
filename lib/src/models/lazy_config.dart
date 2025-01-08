import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lazyui/lazyui.dart';

class LazyConfig {
  final TextStyle font;
  final Color borderColor;
  final double borderWidth;
  final double borderRadius;
  final ThemeMode theme;
  final Color backgroundColor;
  final Color surfaceColor;
  final Color primaryColor;
  final IconType icon;
  final String? locale;
  final bool backBlur;

  LazyConfig(
      {TextStyle? font,
      this.borderColor = Colors.black12,
      this.borderWidth = .5,
      this.borderRadius = 7,
      this.theme = ThemeMode.light,
      this.backgroundColor = Colors.white,
      this.surfaceColor = Colors.white,
      this.primaryColor = Colors.blueAccent,
      this.icon = IconType.huge,
      this.locale,
      this.backBlur = true})
      : font = font ?? GoogleFonts.nunito(fontSize: 15);

  LazyConfig copyWith(
      {TextStyle? font,
      Color? borderColor,
      double? borderWidth,
      double? borderRadius,
      ThemeMode? theme,
      Color? backgroundColor,
      Color? surfaceColor,
      IconType? icon,
      String? locale}) {
    return LazyConfig(
      font: font ?? this.font,
      borderColor: borderColor ?? this.borderColor,
      borderWidth: borderWidth ?? this.borderWidth,
      borderRadius: borderRadius ?? this.borderRadius,
      theme: theme ?? this.theme,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      surfaceColor: surfaceColor ?? this.surfaceColor,
      icon: icon ?? this.icon,
      locale: locale ?? this.locale,
    );
  }
}
