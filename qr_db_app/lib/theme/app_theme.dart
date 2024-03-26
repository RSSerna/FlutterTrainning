import 'package:flutter/material.dart';

class AppTheme
{
  static const Color primaryColor = Colors.blueGrey;
  static ThemeData themeData = ThemeData.light().copyWith(
    primaryColor: primaryColor,
    primaryColorLight: Colors.red,
    //appBarTheme
    appBarTheme: const AppBarTheme(
      elevation: 0,
      color: primaryColor,
    ),
  );
}