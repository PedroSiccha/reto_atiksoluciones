import 'package:flutter/material.dart';

class SummaryCardData {
  final String title;
  final int value;
  final IconData icon;
  final Color color;
  final Color background;

  const SummaryCardData({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
    required this.background,
  });
}