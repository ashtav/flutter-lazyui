import 'package:flutter/material.dart';

class SettingNotifier extends ChangeNotifier {
  String language = 'en';
  bool isDarkMode = false;

  void changeLanguage(Locale data) {
    language = data.languageCode;
    notifyListeners();
  }

  void changeTheme(bool value) {
    isDarkMode = value;
    notifyListeners();
  }
}

final settingNotifier = SettingNotifier();
