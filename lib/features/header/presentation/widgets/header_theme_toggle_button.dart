import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reto_atiksoluciones/core/controllers/theme_controller.dart';

class HeaderThemeToggleButton extends StatelessWidget {
  const HeaderThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeController>();

    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: theme.toggleTheme,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          theme.isDark ? Icons.wb_sunny : Icons.dark_mode,
          size: 20,
        ),
      ),
    );
  }
}