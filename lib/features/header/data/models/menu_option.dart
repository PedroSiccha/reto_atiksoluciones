import 'package:flutter/material.dart';

class MenuOption {
  final IconData? icon;
  final String? label;
  final bool isDestructive;
  final bool isDivider;

  const MenuOption(
      this.icon,
      this.label, {
        this.isDestructive = false,
      }) : isDivider = false;

  const MenuOption.divider()
      : icon = null,
        label = null,
        isDestructive = false,
        isDivider = true;
}