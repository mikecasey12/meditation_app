import 'package:flutter/material.dart';

class ThemeManager with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  ThemeMode get themeMode => _themeMode;

  bool _isDark = false;
  bool get isDark => _isDark;

  void darkMode(bool value) {
    _themeMode = value ? ThemeMode.dark : ThemeMode.light;
    _isDark = value;
    notifyListeners();
  }
}
