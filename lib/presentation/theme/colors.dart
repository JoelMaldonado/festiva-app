import 'package:flutter/material.dart';

class AppColors {
  static const colorP1 = Color(0xFFFF4081);

  // Background colors
  static const colorB1 = Color(0xFF1D1D1D);
  static const colorB2 = Color(0xFF222222);
  static const colorB3 = Color(0xFF292929);
  static const colorB4 = Color(0xFF313131);

  // Accent colors
  static const colorGreen = Color(0xFF00C64F);
  static const colorBlue = Color(0xFF1463FE);
  static const colorRed = Color(0xFFDA1818);
  static const colorYellow = Color(0xFFF4C520);
  static const colorOrange = Color(0xFFF4A300);

  // Text colors
  static const colorT1 = Color(0xFFFFFFFF);
  static const colorT2 = Color(0xFFA5A5A5);
  static const colorT3 = Color(0xFF676767);

  static ColorScheme get colorScheme {
    return ColorScheme(
      brightness: Brightness.dark,
      primary: Colors.white,
      onPrimary: Colors.white,
      secondary: colorBlue,
      onSecondary: Colors.white,
      error: colorRed,
      onError: Colors.white,
      surface: colorP1,
      onSurface: Colors.white,
    );
  }
}
