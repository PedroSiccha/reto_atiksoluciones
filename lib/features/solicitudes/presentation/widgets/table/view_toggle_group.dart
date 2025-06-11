import 'package:flutter/material.dart';
import 'package:reto_atiksoluciones/features/solicitudes/domain/models/solicitud_view_type.dart';

class ViewToggleGroup extends StatelessWidget {
  final SolicitudViewType current;
  final ValueChanged<SolicitudViewType> onChanged;

  const ViewToggleGroup({
    super.key,
    required this.current,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          _ViewToggleButton(
            icon: Icons.view_list,
            isSelected: current == SolicitudViewType.table,
            onTap: () => onChanged(SolicitudViewType.table),
          ),
          _ViewToggleButton(
            icon: Icons.grid_view_rounded,
            isSelected: current == SolicitudViewType.cards,
            onTap: () => onChanged(SolicitudViewType.cards),
          ),
        ],
      ),
    );
  }
}

class _ViewToggleButton extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _ViewToggleButton({
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 2),
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF0061F2) : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Icon(
          icon,
          size: 18,
          color: isSelected ? Colors.white : const Color(0xFF374151),
        ),
      ),
    );
  }
}