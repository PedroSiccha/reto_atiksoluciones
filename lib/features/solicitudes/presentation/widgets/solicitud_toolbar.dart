import 'package:flutter/material.dart';

class SolicitudToolbar extends StatelessWidget {
  final VoidCallback onFilterDate;
  final VoidCallback onExport;

  const SolicitudToolbar({
    super.key,
    required this.onFilterDate,
    required this.onExport,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // Filtrar por fecha
        OutlinedButton.icon(
          onPressed: onFilterDate,
          icon: const Icon(Icons.calendar_today_outlined, size: 18),
          label: const Text('Filtrar por fecha'),
          style: OutlinedButton.styleFrom(
            foregroundColor: const Color(0xFF111827),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            textStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
            side: const BorderSide(color: Color(0xFFE5E7EB)),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        const SizedBox(width: 12),

        // Descargar
        OutlinedButton.icon(
          onPressed: onExport,
          icon: const Icon(Icons.download_outlined, size: 18),
          label: const Text('Descargar'),
          style: OutlinedButton.styleFrom(
            foregroundColor: const Color(0xFF111827),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            textStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
            side: const BorderSide(color: Color(0xFFE5E7EB)),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ],
    );
  }
}