import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reto_atiksoluciones/app.dart';
import 'package:reto_atiksoluciones/features/sidebar/presentation/controllers/sidebar_hover_controller.dart';
import 'package:reto_atiksoluciones/core/controllers/theme_controller.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SidebarHoverController()),
        ChangeNotifierProvider<ThemeController>(create: (_) => ThemeController()),
      ],
      child: const MyApp(),
    ),
  );
}