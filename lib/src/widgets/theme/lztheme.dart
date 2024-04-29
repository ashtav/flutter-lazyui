library lztheme;

import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';
import 'package:lazyui/src/config/colors.dart';

part 'notifier.dart';

class AppThemeData {
  final ThemeData theme;
  final bool isDarkMode;
  final Color? background;

  AppThemeData({required this.theme, this.isDarkMode = false, this.background});
}

class LzTheme extends StatelessWidget {
  final bool darkMode;
  final MaterialApp Function(AppThemeData theme) builder;
  const LzTheme({super.key, required this.builder, this.darkMode = false});

  @override
  Widget build(BuildContext context) {
    LzTheme.toggle(darkMode);

    return themeNotifier.watch((state) {
      return builder.call(AppThemeData(
          theme: state.themeData,
          isDarkMode: state.isDarkMode,
          background: state.isDarkMode ? '444'.hex : Colors.white));
    });
  }

  static toggle(bool isDark) {
    themeNotifier.toggle(isDark);
  }

  static bool get isDark => themeNotifier.isDarkMode;

  static Widget toggleWidget() {
    return LzForm.switches(onChange: (value) {
      themeNotifier.toggle(value);
    });
  }
}
