import 'package:flutter/material.dart';

class EstadoChip extends StatelessWidget {
  final String estado;

  const EstadoChip({super.key, required this.estado});

  Color _backgroundColor(String estado) {
    switch (estado.toLowerCase()) {
      case 'pendiente':
        return const Color(0xFFFEF3C7);
      case 'aprobada':
        return const Color(0xFFD1FAE5);
      case 'rechazada':
        return const Color(0xFFFEE2E2);
      default:
        return const Color(0xFFF3F4F6);
    }
  }

  Color _textColor(String estado) {
    switch (estado.toLowerCase()) {
      case 'pendiente':
        return const Color(0xFFF59E0B);
      case 'aprobada':
        return const Color(0xFF10B981);
      case 'rechazada':
        return const Color(0xFFEF4444);
      default:
        return const Color(0xFF6B7280);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: _backgroundColor(estado),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        estado,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: _textColor(estado),
        ),
      ),
    );
  }
}