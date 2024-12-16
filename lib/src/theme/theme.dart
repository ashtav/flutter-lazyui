import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lazyui/lazyui.dart';
import 'package:lazyui/src/theme/colors.dart';

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
    Utils.setSystemUI(navBarColor: Colors.white);

    return ThemeData.light().copyWith(
      brightness: Brightness.light,
      appBarTheme: AppBarTheme(
          titleTextStyle: gfont.copyWith(fontSize: 20, color: Colors.black87),
          backgroundColor: Colors.white,
          foregroundColor: Colors.white,
          shadowColor: Colors.black38,
          elevation: 0,
          scrolledUnderElevation: 0,
          surfaceTintColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black87, size: 20),
          shape: Border(bottom: BorderSide(color: lzBorderColor, width: .5))),
      scaffoldBackgroundColor: 'fafafa'.hex,
      textTheme: TextTheme(bodyMedium: gfont.copyWith(color: Colors.black87)),
      iconTheme: const IconThemeData(size: 20, color: Colors.black87),
    );
  }

  /// Returns the dark theme configuration.
  static ThemeData get dark {
    Utils.setSystemUI(navBarColor: Colors.black);

    return ThemeData.dark().copyWith(
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(
          titleTextStyle: gfont.copyWith(fontSize: 20, color: Colors.white),
          iconTheme: const IconThemeData(color: Colors.white, size: 20),
          shape: Border(bottom: BorderSide(color: Colors.white12, width: .5))),
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
      background: isDark ? '1e1d21'.hex : Colors.white,
      isDarkMode: isDark,
    );
  }

  /// Retrieves the system theme configuration.
  ///
  /// Returns the system's current theme, either light or dark.
  static ThemeData system() {
    Utils.setSystemUI();

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
      lzBorderColor = Colors.black12.invert();
      lzIconColor = Colors.black45.invert();
      lzBackgroundColor = '1e1d21'.hex;
      gfont = gfont.copyWith(color: Colors.white);
    } else {
      lzBorderColor = Colors.black12;
      lzIconColor = Colors.black45;
      lzBackgroundColor = Colors.white;
      gfont = gfont.copyWith(color: Colors.black87);
    }
  }
}
