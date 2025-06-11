import 'package:flutter/material.dart';
import 'package:reto_atiksoluciones/core/contracts/theme_state.dart';

class ThemeController extends ChangeNotifier implements ThemeState {
  bool _isDark = false;

  @override
  bool get isDark => _isDark;

  @override
  void toggleTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }
  ThemeMode get themeMode => _isDark ? ThemeMode.dark : ThemeMode.light;
}