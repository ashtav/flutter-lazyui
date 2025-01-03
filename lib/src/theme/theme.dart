import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:lazyui/lazyui.dart';
import 'package:lazyui/src/icons/icons_map.dart';
import 'package:lazyui/src/theme/color.dart';

import '../config/config.dart';

void _applyTheme(bool isDarkMode) {
  config = config.copyWith(
      theme: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      backgroundColor: isDarkMode ? darkBackgroundColor : scaffoldBackgroundColor,
      borderColor: isDarkMode ? Colors.white10 : Colors.black12);

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarIconBrightness: Brightness.dark,
    statusBarIconBrightness: null,
    statusBarColor: Colors.transparent,
    systemNavigationBarDividerColor: null,
    systemNavigationBarColor: isDarkMode ? darkBackgroundColor : backgroundColor,
  ));
}

class _ThemeNotifier extends ChangeNotifier {
  _ThemeNotifier() {
    setTheme(ThemeMode.light);
  }

  ThemeData theme = LzTheme.light;

  // if mode is null, use system theme instead
  void setTheme([ThemeMode? mode]) {
    bool isDarkMode = mode == ThemeMode.dark;

    if (mode == null) {
      // check system settings
      Brightness brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
      isDarkMode = brightness == Brightness.dark;
    }

    theme = isDarkMode ? LzTheme.dark : LzTheme.light;

    _applyTheme(isDarkMode);

    notifyListeners();
  }
}

final _themeNotifier = _ThemeNotifier();

class LzTheme extends StatelessWidget {
  final Function(ThemeData theme) child;
  final ThemeData? theme;
  const LzTheme({super.key, required this.child, this.theme});

  @override
  Widget build(BuildContext context) {
    return _themeNotifier.watch((state) => child(state.theme));
  }

  /// if mode is null, use system theme instead
  static void set([ThemeMode? mode]) {
    _themeNotifier.setTheme(mode);
  }

  /// toggle between dark and light theme
  static void toggle() {
    _themeNotifier.setTheme(_themeNotifier.theme.brightness == Brightness.dark ? ThemeMode.light : ThemeMode.dark);
  }

  static Widget watch(Widget Function(ThemeMode) builder) {
    return _themeNotifier.watch((state) => builder(config.theme));
  }

  /// check if current theme is dark
  static bool get isDarkMode => config.theme == ThemeMode.dark;

  /// get current theme
  static ThemeMode get current => config.theme;

  /// get light theme
  static ThemeData get light {
    final font = config.font.copyWith(color: Colors.black87);

    _applyTheme(false);

    return ThemeData.light().copyWith(
      brightness: Brightness.light,
      appBarTheme: AppBarTheme(
          titleTextStyle: config.font.copyWith(fontSize: 20, color: Colors.black87),
          backgroundColor: backgroundColor,
          foregroundColor: Colors.white,
          shadowColor: Colors.black38,
          elevation: 0,
          scrolledUnderElevation: 0,
          surfaceTintColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black87, size: 20),
          shape: Border(bottom: BorderSide(color: config.borderColor, width: .5))),
      scaffoldBackgroundColor: Lz.color.hex('fafafa'),
      textTheme: TextTheme(
          displayLarge: font.copyWith(fontSize: 32),
          displayMedium: font.copyWith(fontSize: 28),
          displaySmall: font.copyWith(fontSize: 24),
          headlineLarge: font.copyWith(fontSize: 20),
          headlineMedium: font.copyWith(fontSize: 18),
          headlineSmall: font.copyWith(fontSize: 16),
          titleLarge: font.copyWith(fontSize: 18),
          titleMedium: font.copyWith(fontSize: 16),
          titleSmall: font.copyWith(fontSize: 14),
          bodyLarge: font,
          bodyMedium: font,
          bodySmall: font,
          labelLarge: font,
          labelMedium: font,
          labelSmall: font),
      iconTheme: const IconThemeData(size: 20, color: Colors.black87),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(textStyle: config.font.copyWith(color: Colors.black87)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(textStyle: config.font.copyWith(color: Colors.white)),
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: Colors.black87,
        selectionColor: Colors.black12,
        selectionHandleColor: Colors.black87,
      ),
    );
  }

  static ThemeData get dark {
    final font = config.font.copyWith(color: Colors.white70);

    _applyTheme(true);

    return ThemeData.dark().copyWith(
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(
        titleTextStyle: config.font.copyWith(fontSize: 20, color: Colors.white70),
        backgroundColor: darkAppbarColor,
        foregroundColor: Colors.white70,
        shadowColor: Colors.black38,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white70, size: 20),
        shape: Border(bottom: BorderSide(color: config.borderColor, width: .5)),
      ),
      scaffoldBackgroundColor: darkBackgroundColor,
      textTheme: TextTheme(
        displayLarge: font.copyWith(fontSize: 32),
        displayMedium: font.copyWith(fontSize: 28),
        displaySmall: font.copyWith(fontSize: 24),
        headlineLarge: font.copyWith(fontSize: 20),
        headlineMedium: font.copyWith(fontSize: 18),
        headlineSmall: font.copyWith(fontSize: 16),
        titleLarge: font.copyWith(fontSize: 18),
        titleMedium: font.copyWith(fontSize: 16),
        titleSmall: font.copyWith(fontSize: 14),
        bodyLarge: font,
        bodyMedium: font,
        bodySmall: font,
        labelLarge: font,
        labelMedium: font,
        labelSmall: font,
      ),
      iconTheme: const IconThemeData(size: 20, color: Colors.white70),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(textStyle: config.font.copyWith(color: Colors.white70)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(textStyle: config.font.copyWith(color: Colors.black)),
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: Colors.white70,
        selectionColor: Colors.white10,
        selectionHandleColor: Colors.white70,
      ),
    );
  }
}

extension CustomThemeModeExtension on ThemeMode {
  bool get isDark => this == ThemeMode.dark;
  bool get isLight => this == ThemeMode.light;
}

class LzThemeAction extends StatelessWidget {
  final IconData? light;
  final IconData? dark;

  const LzThemeAction({super.key, this.light, this.dark});

  @override
  Widget build(BuildContext context) {
    return LzTheme.watch((theme) => IconButton(
        onPressed: () => LzTheme.toggle(),
        icon: Icon(theme.isDark ? (light ?? ConfigIcon.get(IconSet.sun)) : (dark ?? ConfigIcon.get(IconSet.moon)))));
  }
}
