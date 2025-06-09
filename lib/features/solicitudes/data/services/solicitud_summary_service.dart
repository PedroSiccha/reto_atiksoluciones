import 'package:flutter/material.dart';
import 'package:reto_atiksoluciones/features/solicitudes/data/models/solicitud_model.dart';
import 'package:reto_atiksoluciones/features/solicitudes/data/models/summary_card_data.dart';

class SolicitudSummaryService {
  static List<SummaryCardData> buildSummaryCards(List<SolicitudModel> solicitudes) {
    final total = solicitudes.length;
    final pendientes = solicitudes.where((s) => s.estado == 'Pendiente').length;
    final aprobadas = solicitudes.where((s) => s.estado == 'Aprobada').length;
    final rechazadas = solicitudes.where((s) => s.estado == 'Rechazada').length;

    return [
      SummaryCardData(
        title: 'Total Solicitudes',
        value: total,
        icon: Icons.description_outlined,
        color: const Color(0xFF2563EB),
        background: const Color(0xFFDDEAFE),
      ),
      SummaryCardData(
        title: 'Pendientes',
        value: pendientes,
        icon: Icons.access_time,
        color: const Color(0xFFF59E0B),
        background: const Color(0xFFFFF7ED),
      ),
      SummaryCardData(
        title: 'Aprobadas',
        value: aprobadas,
        icon: Icons.check_circle,
        color: const Color(0xFF10B981),
        background: const Color(0xFFE6F9F1),
      ),
      SummaryCardData(
        title: 'Rechazadas',
        value: rechazadas,
        icon: Icons.warning_amber_rounded,
        color: const Color(0xFFEF4444),
        background: const Color(0xFFFEE2E2),
      ),
    ];
  }
}