import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFFF9FAFB),
    primaryColor: const Color(0xFF0061F2),
    useMaterial3: true,
    fontFamily: 'Inter',
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
    ),
  );

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFF121212),
    primaryColor: const Color(0xFF0061F2),
    useMaterial3: true,
    fontFamily: 'Inter',
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1E1E1E),
      elevation: 0,
    ),
    colorScheme: const ColorScheme.dark(
      background: Color(0xFF121212),
      surface: Color(0xFF1E1E1E),
      primary: Color(0xFF0061F2),
    ),
  );
}