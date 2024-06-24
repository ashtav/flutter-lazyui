import 'package:flutter/material.dart';
import 'package:lazyui/config/lazyui.dart';

/// Provides access to pre-configured light and dark themes for your LazyUI application.

class LzTheme {
  /// Access the pre-configured light theme.

  static ThemeData get light {
    /// Returns a light theme with common styles applied for LazyUI apps.

    return ThemeData.light().copyWith(
      brightness: Brightness.light,
      appBarTheme: AppBarTheme(
        elevation: .5,
        titleTextStyle: LazyUi.font.copyWith(fontSize: 20, color: Colors.black87),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      textTheme: TextTheme(bodyMedium: LazyUi.font.copyWith(color: Colors.black87)),
      iconTheme: const IconThemeData(size: 20, color: Colors.black87),
    );
  }

  /// Access the pre-configured dark theme.

  static ThemeData get dark {
    /// Returns a dark theme with common styles applied for LazyUI apps.

    return ThemeData.dark().copyWith(
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(
        elevation: .5,
        titleTextStyle: LazyUi.font.copyWith(fontSize: 20, color: Colors.white),
      ),
      textTheme: TextTheme(bodyMedium: LazyUi.font.copyWith(color: Colors.white)),
      iconTheme: const IconThemeData(size: 20, color: Colors.white),
    );
  }
}
