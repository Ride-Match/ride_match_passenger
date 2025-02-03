import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  ThemeProvider() {
    _loadTheme();
  }

  void _loadTheme() async {
    final String mode = 'light';
    _themeMode = mode == 'dark' ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  void saveTheme(String mode) async {
    _themeMode = mode == 'dark' ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
