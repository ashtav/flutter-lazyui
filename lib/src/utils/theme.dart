library lztheme;

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lazyui/lazyui.dart';
import 'package:lazyui/src/config/theme.dart';

/// A class representing application theme data.
class AppThemeData {
  /// The main theme data for the application.
  final ThemeData theme;

  /// Indicates whether dark mode is enabled.
  final bool isDarkMode;

  /// Optional background color associated with the theme.
  final Color? background;

  /// Constructs an [AppThemeData] object with required [theme], optional [isDarkMode]
  /// indicating if dark mode is enabled (defaults to false), and optional [background] color.
  AppThemeData({
    required this.theme,
    this.isDarkMode = false,
    this.background,
  });
}

/// Indicates whether the application is currently in dark mode.
bool lzDarkMode = false;

/// A class providing theme configurations for the application.
class LzTheme {
  /// Returns the light theme configuration.
  static ThemeData get light {
    return ThemeData.light().copyWith(
      brightness: Brightness.light,
      appBarTheme: AppBarTheme(
        elevation: 0.5,
        titleTextStyle: gfont.copyWith(fontSize: 20, color: Colors.black87),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      textTheme: TextTheme(bodyMedium: gfont.copyWith(color: Colors.black87)),
      iconTheme: const IconThemeData(size: 20, color: Colors.black87),
    );
  }

  /// Returns the dark theme configuration.
  static ThemeData get dark {
    return ThemeData.dark().copyWith(
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(
        elevation: 0.5,
        titleTextStyle: gfont.copyWith(fontSize: 20, color: Colors.white),
      ),
      textTheme: TextTheme(bodyMedium: gfont.copyWith(color: Colors.white)),
      iconTheme: const IconThemeData(size: 20, color: Colors.white),
    );
  }

  /// Retrieves the current theme based on the provided [context].
  ///
  /// [context]: The BuildContext from which to determine the theme.
  ///
  /// Returns an [AppThemeData] object containing the current theme configuration.
  static AppThemeData get(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return AppThemeData(
      theme: isDark ? LzTheme.dark : LzTheme.light,
      background: isDark ? '444'.hex : Colors.white,
      isDarkMode: isDark,
    );
  }

  /// Retrieves the system theme configuration.
  ///
  /// Returns the system's current theme, either light or dark.
  static ThemeData system() {
    Brightness brightness =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return isDarkMode ? LzTheme.dark : LzTheme.light;
  }

  /// Sets the application theme based on the specified [darkMode].
  ///
  /// [darkMode]: Boolean indicating whether to set the theme to dark mode.
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

/// Extension on [Color] providing a method to adapt color based on the current theme.
extension CustomColorExtension on Color {
  /// Adapts the color based on the current application theme.
  ///
  /// Returns the inverse of the color if [lzDarkMode] is `true`, otherwise returns the color itself.
  Color get adaptWithTheme {
    return lzDarkMode ? inverse() : this;
  }
}
