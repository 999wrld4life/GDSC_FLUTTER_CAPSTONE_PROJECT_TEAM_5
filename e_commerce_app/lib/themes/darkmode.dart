import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyle(color: Colors.white)),
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Colors.grey.shade900,
    primary: Colors.grey.shade800,
    secondary: Colors.grey.shade700,
    inversePrimary: Colors.grey.shade100,
  ),
);
