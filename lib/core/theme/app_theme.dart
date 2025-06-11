import 'package:flutter/material.dart';
import 'package:reto_atiksoluciones/core/constants/app_colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.background,
    primaryColor: AppColors.primary,
    useMaterial3: true,
    fontFamily: 'Inter',
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
    ),
  );

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundDark,
    primaryColor: AppColors.background,
    useMaterial3: true,
    fontFamily: 'Inter',
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.backgroundDark,
      elevation: 0,
    ),
    colorScheme: const ColorScheme.dark(
      background: Color(0xFF121212),
      surface: AppColors.backgroundDark,
      primary: AppColors.background,
    ),
  );
}