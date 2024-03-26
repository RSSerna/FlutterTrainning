import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;
  ThemeData _themeData = ThemeData.light();

  ThemeChanger(int theme) {
    switch (theme) {
      case 1: //light
        _customTheme = false;
        _darkTheme = false;
        _themeData = ThemeData.light();
        break;
      case 2: //dark
        _customTheme = false;
        _darkTheme = true;
        _themeData = ThemeData.dark();
        break;
      case 3: //custom
        _customTheme = true;
        _darkTheme = false;
        _themeData = ThemeData.light();
        break;
      default: //light
        _customTheme = false;
        _darkTheme = false;
        _themeData = ThemeData.light();
        break;
    }
  }

  ThemeData get themeData => _themeData;

  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _customTheme = false;
    _darkTheme = value;

    _themeData = value ? ThemeData.dark() : ThemeData.light();

    notifyListeners();
  }

  get customTheme => _customTheme;

  set customTheme(value) {
    _darkTheme = false;
    _customTheme = value;
    _themeData = value ? ThemeData.light() : ThemeData.light();
    notifyListeners();
  }
}
