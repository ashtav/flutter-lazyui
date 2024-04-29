part of lztheme;

final themeNotifier = ThemeNotifier();

class ThemeNotifier extends ChangeNotifier {
  ThemeData _themeData = ThemeData.light().lightCustom();
  ThemeData get themeData => _themeData;

  bool isDarkMode = false;

  void toggle(bool isDark) {
    _themeData = (isDark
        ? ThemeData.dark().darkCustom()
        : ThemeData.light().lightCustom());
    isDarkMode = isDark;

    if (isDark) {
      lzBorderColor = Colors.black12.inverse();
      lzBackgroundColor = '444'.hex;
    } else {
      lzBorderColor = Colors.black12;
      lzBackgroundColor = Colors.white;
    }

    notifyListeners();
  }
}

extension ThemeDataExtension on ThemeData {
  ThemeData lightCustom() {
    return copyWith(
        brightness: Brightness.light,
        appBarTheme: AppBarTheme(
          centerTitle: false,
          backgroundColor: Colors.white,
          elevation: .5,
          titleTextStyle: Gfont.fs20.black,
          iconTheme: const IconThemeData(color: Colors.black87, size: 20),
        ),
        iconTheme: const IconThemeData(color: Colors.black87, size: 20),
        textTheme: TextTheme(
            bodyLarge: gfont,
            bodyMedium: gfont.copyWith(color: Colors.black),
            titleMedium: gfont,
            titleSmall: gfont));
  }

  ThemeData darkCustom() {
    return copyWith(
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          centerTitle: false,
          elevation: .5,
          titleTextStyle: Gfont.fs20.white,
          iconTheme: const IconThemeData(color: Colors.white, size: 20),
        ),
        iconTheme: const IconThemeData(color: Colors.white, size: 20),
        textTheme: TextTheme(
          bodyLarge: gfont.copyWith(color: Colors.white),
          bodyMedium: gfont.copyWith(color: Colors.white),
          bodySmall: gfont.copyWith(color: Colors.white),
          titleLarge: gfont.copyWith(color: Colors.white),
          titleMedium: gfont.copyWith(color: Colors.white),
          titleSmall: gfont.copyWith(color: Colors.white),
        ));
  }
}
