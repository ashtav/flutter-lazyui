library lztheme;

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lazyui/lazyui.dart';
import 'package:lazyui/src/config/theme.dart';

bool lzDarkMode = false;

class AppThemeData {
  final ThemeData theme;
  final bool isDarkMode;
  final Color? background;

  AppThemeData({required this.theme, this.isDarkMode = false, this.background});
}

class LzTheme {
  static ThemeData light() {
    return ThemeData.light().copyWith(
        brightness: Brightness.light,
        appBarTheme: AppBarTheme(
            elevation: .5,
            titleTextStyle: gfont.copyWith(fontSize: 20, color: Colors.black87),
            backgroundColor: Colors.white,
            iconTheme: const IconThemeData(color: Colors.black87)),
        textTheme: TextTheme(bodyMedium: gfont.copyWith(color: Colors.black87)),
        iconTheme: const IconThemeData(size: 20, color: Colors.black87));
  }

  static ThemeData dark() {
    return ThemeData.dark().copyWith(
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
            elevation: .5,
            titleTextStyle: gfont.copyWith(fontSize: 20, color: Colors.white)),
        textTheme: TextTheme(bodyMedium: gfont.copyWith(color: Colors.white)),
        iconTheme: const IconThemeData(size: 20, color: Colors.white));
  }

  static AppThemeData get(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return AppThemeData(
        theme: isDark ? LzTheme.dark() : LzTheme.light(),
        background: isDark ? '444'.hex : Colors.white,
        isDarkMode: isDark);
  }

  static ThemeData system() {
    Brightness brightness =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return isDarkMode ? LzTheme.dark() : LzTheme.light();
  }

  static void setTheme(bool darkMode) {
    lzDarkMode = darkMode;

    if (darkMode) {
      lzBorderColor = Colors.black12.inverse();
      lzIconColor = Colors.black45.inverse();
      lzBackgroundColor = '444'.hex;
      gfont = gfont.copyWith(color: Colors.white);
    } else {
      lzBorderColor = Colors.black12;
      lzIconColor = Colors.black45;
      lzBackgroundColor = Colors.white;
      gfont = gfont.copyWith(color: Colors.black87);
    }
  }
}

extension CustomColorExtension on Color {
  Color get adaptWithTheme {
    return lzDarkMode ? inverse() : this;
  }
}
