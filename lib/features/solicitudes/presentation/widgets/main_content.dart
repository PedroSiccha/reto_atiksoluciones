import 'package:flutter/material.dart';
import 'package:reto_atiksoluciones/features/solicitudes/data/mocks/mock_solicitudes.dart';
import 'package:reto_atiksoluciones/features/solicitudes/data/services/solicitud_summary_service.dart';
import 'package:reto_atiksoluciones/features/solicitudes/presentation/widgets/section_filters.dart';
import 'package:reto_atiksoluciones/features/solicitudes/presentation/widgets/section_header.dart';
import 'package:reto_atiksoluciones/features/solicitudes/presentation/widgets/section_summary_cards.dart';
import 'package:reto_atiksoluciones/features/solicitudes/presentation/widgets/section_table.dart';

class MainContent extends StatelessWidget {
  const MainContent({super.key});

  @override
  Widget build(BuildContext context) {
    final summaryCards = SolicitudSummaryService.buildSummaryCards(mockSolicitudesData);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Cabecera (título + botón)
          const SectionHeader(),
          const SizedBox(height: 24),

          // Filtros superiores
          const SectionFilters(),
          const SizedBox(height: 24),

          // Cards resumen (Totales: Aprobadas, Pendientes, etc.)
          SectionSummaryCards(cards: summaryCards),
          const SizedBox(height: 24),

          // Tabla de solicitudes
          const SectionTable(),
        ],
      ),
    );
  }
}