import 'package:flutter/material.dart';

class ThemeConfig {
  static Color lightPrimary = Colors.white;
  static const Color darkPrimary = Color(0xff1f1f1f);
  static const Color lightAccent = Color(0xff2ca8e2);
  static const Color darkAccent = Color(0xff2ca8e2);
  static Color lightBG = Colors.white;
  static const Color darkBG = Color(0xff121212);

  static ThemeData lightTheme = ThemeData(
    backgroundColor: lightBG,
    primaryColor: lightPrimary,
    scaffoldBackgroundColor: lightBG,
    appBarTheme: const AppBarTheme(
      elevation: 0.0,
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: lightAccent),
    textSelectionTheme: const TextSelectionThemeData(cursorColor: lightAccent),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: darkBG,
    primaryColor: darkPrimary,
    scaffoldBackgroundColor: darkBG,
    appBarTheme: const AppBarTheme(
      elevation: 0.0,
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: darkAccent),
    textSelectionTheme: const TextSelectionThemeData(cursorColor: darkAccent),
  );
}
