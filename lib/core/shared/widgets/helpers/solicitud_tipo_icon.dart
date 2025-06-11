import 'package:flutter/material.dart';

class SolicitudTipoIcon {
  static IconData getIcon(String tipo) {
    switch (tipo.toLowerCase()) {
      case 'vacaciones':
        return Icons.beach_access;
      case 'permiso':
        return Icons.calendar_today;
      case 'licencia médica':
        return Icons.local_hospital;
      case 'cambio puesto':
        return Icons.swap_horiz;
      case 'cambio alojamiento':
        return Icons.meeting_room;
      case 'uniformes':
        return Icons.checkroom;
      default:
        return Icons.label;
    }
  }

  static Color getColor(String tipo) {
    switch (tipo.toLowerCase()) {
      case 'vacaciones':
        return const Color(0xFF2563EB);
      case 'permiso':
        return const Color(0xFF10B981);
      case 'licencia médica':
        return const Color(0xFFEF4444);
      case 'cambio puesto':
        return const Color(0xFFF59E0B);
      default:
        return const Color(0xFF6B7280);
    }
  }

  static Color getBackground(String tipo) {
    switch (tipo.toLowerCase()) {
      case 'vacaciones':
        return const Color(0xFFE0EDFF);
      case 'permiso':
        return const Color(0xFFE6F6EF);
      case 'licencia médica':
        return const Color(0xFFFDE8E8);
      case 'cambio puesto':
        return const Color(0xFFFFF7ED);
      default:
        return const Color(0xFFF3F4F6);
    }
  }
}