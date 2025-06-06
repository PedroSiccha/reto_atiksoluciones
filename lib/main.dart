import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reto_atiksoluciones/app.dart';
import 'package:reto_atiksoluciones/core/shared/controllers/sidebar_hover_controller.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SidebarHoverController()),
      ],
      child: const MyApp(),
    ),
  );
}