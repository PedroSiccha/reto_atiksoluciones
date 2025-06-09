import 'package:flutter/material.dart';
import 'package:reto_atiksoluciones/features/solicitudes/data/models/summary_card_data.dart';
import 'package:reto_atiksoluciones/features/solicitudes/presentation/widgets/summary_card.dart';

class SectionSummaryCards extends StatelessWidget {
  final List<SummaryCardData> cards;

  const SectionSummaryCards({super.key, required this.cards});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double maxWidth = constraints.maxWidth;

        // calcular cuántas columnas caben
        int columns = (maxWidth ~/ 260).clamp(1, cards.length);

        // calcular el ancho exacto por card
        double spacing = 16;
        double availableWidth = maxWidth - spacing * (columns - 1);
        double cardWidth = availableWidth / columns;

        return Wrap(
          spacing: spacing,
          runSpacing: 16,
          children: cards
              .map(
                (data) => SizedBox(
              width: cardWidth,
              child: SummaryCard(data: data),
            ),
          )
              .toList(),
        );
      },
    );
  }
}