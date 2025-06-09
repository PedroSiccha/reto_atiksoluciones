import 'package:flutter/material.dart';
import 'package:reto_atiksoluciones/features/solicitudes/presentation/widgets/filter_advanced_panel.dart';

class SectionFilters extends StatelessWidget {
  const SectionFilters({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Row(
        children: [
          // 🔍 Input de búsqueda
          Expanded(
            flex: 2,
            child: TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                hintText: 'Buscar solicitudes...',
                prefixIcon: const Icon(Icons.search, size: 20, color: Color(0xFF9CA3AF)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
                ),
              ),
            ),
          ),

          const SizedBox(width: 16),

          // ⬇️ Filtro avanzado
          Expanded(
            flex: 1,
            child: PopupMenuButton<int>(
              onSelected: (value) {},
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              itemBuilder: (context) => [
                PopupMenuItem(
                  enabled: false,
                  padding: EdgeInsets.zero,
                  child: FilterAdvancedPanel(
                    onClear: () {
                      // TODO: limpiar filtros
                    },
                    onApply: () {
                      // TODO: aplicar filtros
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFE5E7EB)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Filtro avanzado',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF111827),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_down_rounded, size: 20, color: Color(0xFF6B7280)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}