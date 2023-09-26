import 'package:flutter/material.dart';

class SettingProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  String currentLang = "en";

  enableDarkTheme() {
    themeMode = ThemeMode.dark;
    notifyListeners();
  }

  enableLightTheme() {
    themeMode = ThemeMode.light;
    notifyListeners();
  }

  bool isDark() {
    return themeMode == ThemeMode.dark;
  }

  changeLang(String newLang) {
    if (currentLang == newLang) return;
    currentLang = newLang;
    notifyListeners();
  }
}
