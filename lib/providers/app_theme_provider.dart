import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppThemeProvider extends ChangeNotifier {
  //todo data
  ThemeMode appTheme = ThemeMode.light;
  //todo function
  void changeThemeMode(ThemeMode newTheme) {
    if (appTheme == newTheme) {
      return;
    }
    appTheme = newTheme;
    notifyListeners();
  }
}
