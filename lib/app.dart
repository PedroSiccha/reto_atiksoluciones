import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reto_atiksoluciones/core/router/app_router.dart';
import 'package:reto_atiksoluciones/core/controllers/theme_controller.dart';
import 'package:reto_atiksoluciones/core/theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = context.watch<ThemeController>();
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeController.themeMode,
      routerConfig: AppRouter.router,
    );
  }
}