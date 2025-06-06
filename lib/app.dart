import 'package:flutter/material.dart';
import 'package:reto_atiksoluciones/core/router/app_router.dart';
import 'package:reto_atiksoluciones/core/theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routerConfig: AppRouter.router,
    );
  }
}