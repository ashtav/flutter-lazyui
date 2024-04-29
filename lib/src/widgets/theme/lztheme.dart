library lztheme;

import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';
import 'package:lazyui/src/config/colors.dart';

part 'notifier.dart';

class LzTheme extends StatelessWidget {
  final bool darkMode;
  final MaterialApp Function(ThemeData theme) builder;
  const LzTheme({super.key, required this.builder, this.darkMode = false});

  @override
  Widget build(BuildContext context) {
    LzTheme.toggle(darkMode);

    return themeNotifier.watch((state) {
      return builder.call(state.themeData);
    });
  }

  static toggle(bool isDark) {
    themeNotifier.toggle(isDark);
  }

  static bool get isDark => themeNotifier.isDarkMode;
}
