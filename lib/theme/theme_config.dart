import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeConfig {
  static const Color lightPrimary = Colors.white;
  static const Color darkPrimary = Color(0xff1f1f1f);
  static const Color lightAccent = Color(0xff2ca8e2);
  static const Color darkAccent = Color(0xff2ca8e2);
  static const Color lightBG = Colors.white;
  static const Color darkBG = Color(0xff121212);

  static ThemeData lightThemeData = themeData(lightColorScheme, lightAccent);
  static ThemeData darkThemeData = themeData(darkColorScheme, darkAccent);

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
      textTheme: GoogleFonts.sourceSansProTextTheme(),
      colorScheme: colorScheme,

      // Matches manifest.json colors and background color.
      primaryColor: const Color(0xFF030303),
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.background,
        elevation: 0,
        iconTheme: IconThemeData(color: colorScheme.primary),
      ),
      iconTheme: IconThemeData(color: colorScheme.onPrimary),
      canvasColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      highlightColor: Colors.transparent,
      focusColor: focusColor,
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Color.alphaBlend(
          lightAccent.withOpacity(0.80),
          darkAccent,
        ),
      ),
    );
  }

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: lightPrimary,
    primaryVariant: lightAccent,
    secondary: lightAccent,
    secondaryVariant: lightBG,
    background: lightBG,
    surface: lightBG,
    onBackground: lightBG,
    error: lightAccent,
    onError: lightAccent,
    onPrimary: lightAccent,
    onSecondary: lightAccent,
    onSurface: lightAccent,
    brightness: Brightness.light,
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

  static const ColorScheme darkColorScheme = ColorScheme(
    primary: darkPrimary,
    primaryVariant: darkAccent,
    secondary: darkAccent,
    secondaryVariant: darkAccent,
    background: darkBG,
    surface: darkBG,
    onBackground: darkAccent, // White with 0.05 opacity
    error: darkAccent,
    onError: darkAccent,
    onPrimary: darkAccent,
    onSecondary: darkAccent,
    onSurface: Colors.red,
    brightness: Brightness.dark,
  );

  static Color getAccent() {
    if (Get.theme.brightness == Brightness.dark) {
      return darkAccent;
    }
    return lightAccent;
  }

  static Color getPrimary() {
    if (Get.theme.brightness == Brightness.dark) {
      return darkPrimary;
    }
    return lightPrimary;
  }

  static Color getNotPrimary() {
    if (Get.theme.brightness == Brightness.dark) {
      return lightPrimary;
    }
    return darkPrimary;
  }

  static bool isTheme() => Get.theme.brightness != Brightness.dark;

  static Color compareColor(Color fColor, Color sColor) {
    return isTheme() ? fColor : sColor;
  }

  static Color color54() {
    return isTheme() ? Colors.black54 : Colors.white54;
  }

  static Color colorGreyAndWhite54() {
    return isTheme() ? Colors.black54 : Colors.white54;
  }
}
