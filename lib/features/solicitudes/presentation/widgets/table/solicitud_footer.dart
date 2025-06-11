import 'package:flutter/material.dart';

class SolicitudFooter extends StatelessWidget {
  final int currentPage;
  final int rowsPerPage;
  final int totalItems;
  final void Function(int page) onPageChanged;
  final void Function(int rows) onRowsChanged;

  const SolicitudFooter({
    super.key,
    required this.currentPage,
    required this.rowsPerPage,
    required this.totalItems,
    required this.onPageChanged,
    required this.onRowsChanged,
  });

  @override
  Widget build(BuildContext context) {
    final totalPages = (totalItems / rowsPerPage).ceil();
    final start = ((currentPage - 1) * rowsPerPage) + 1;
    final end = (start + rowsPerPage - 1).clamp(1, totalItems);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Mostrando $start–$end de $totalItems resultados',
          style: const TextStyle(
            fontSize: 13,
            color: Color(0xFF6B7280),
          ),
        ),

        Row(
          children: [
            const Text(
              'Registros por página:',
              style: TextStyle(
                fontSize: 13,
                color: Color(0xFF6B7280),
              ),
            ),
            const SizedBox(width: 8),
            DropdownButton<int>(
              value: rowsPerPage,
              underline: const SizedBox.shrink(),
              borderRadius: BorderRadius.circular(8),
              items: const [6, 10, 25, 50].map((n) {
                return DropdownMenuItem(value: n, child: Text(n.toString()));
              }).toList(),
              onChanged: (value) {
                if (value != null) onRowsChanged(value);
              },
            ),
            const SizedBox(width: 16),

            IconButton(
              icon: const Icon(Icons.chevron_left),
              tooltip: 'Anterior',
              onPressed: currentPage > 1 ? () => onPageChanged(currentPage - 1) : null,
            ),
            Text(
              '$currentPage / $totalPages',
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            IconButton(
              icon: const Icon(Icons.chevron_right),
              tooltip: 'Siguiente',
              onPressed: currentPage < totalPages ? () => onPageChanged(currentPage + 1) : null,
            ),
          ],
        )
      ],
    );
  }
}