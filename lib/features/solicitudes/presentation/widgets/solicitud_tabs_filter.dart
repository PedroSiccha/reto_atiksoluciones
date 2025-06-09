import 'package:flutter/material.dart';

class SolicitudTabsFilter extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  const SolicitudTabsFilter({
    super.key,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final tabs = ['Todas', 'Pendientes', 'Aprobadas', 'Rechazadas'];

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB), // fondo gris claro del grupo
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE5E7EB)), // gris claro
      ),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(tabs.length, (index) {
          final isSelected = index == selectedIndex;

          return GestureDetector(
            onTap: () => onChanged(index),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 2),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? Colors.white : Colors.transparent,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                tabs[index],
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: isSelected ? const Color(0xFF111827) : const Color(0xFF6B7280),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
