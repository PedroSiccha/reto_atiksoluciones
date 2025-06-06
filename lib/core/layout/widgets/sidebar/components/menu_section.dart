import 'package:flutter/material.dart';
import 'package:reto_atiksoluciones/core/layout/widgets/sidebar/components/menu_sub_item.dart';

class MenuSection {
  final String title;
  final IconData icon;
  final List<MenuSubItem> children;

  MenuSection({
    required this.title,
    required this.icon,
    this.children = const [],
  });
}