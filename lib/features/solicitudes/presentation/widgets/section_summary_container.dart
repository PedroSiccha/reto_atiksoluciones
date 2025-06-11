import 'package:flutter/material.dart';
import 'package:reto_atiksoluciones/features/solicitudes/data/mocks/mock_solicitudes.dart';
import 'package:reto_atiksoluciones/features/solicitudes/data/services/solicitud_summary_service.dart';
import 'package:reto_atiksoluciones/features/solicitudes/presentation/widgets/section_summary_cards.dart';

class SectionSummaryContainer extends StatelessWidget {
  const SectionSummaryContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final cards = SolicitudSummaryService.buildSummaryCards(mockSolicitudesData);
    return SectionSummaryCards(cards: cards);
  }
}