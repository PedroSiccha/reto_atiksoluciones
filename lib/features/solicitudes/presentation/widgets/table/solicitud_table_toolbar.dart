import 'package:flutter/material.dart';
import 'package:reto_atiksoluciones/features/solicitudes/domain/models/solicitud_view_type.dart';
import 'package:reto_atiksoluciones/features/solicitudes/presentation/widgets/table/solicitud_tabs_filter.dart';
import 'package:reto_atiksoluciones/features/solicitudes/presentation/widgets/table/view_toggle_group.dart';

class SolicitudTableToolbar extends StatelessWidget {
  final int currentTabIndex;
  final SolicitudViewType viewType;
  final ValueChanged<int> onTabChanged;
  final ValueChanged<SolicitudViewType> onViewChanged;
  final VoidCallback onExport;
  final VoidCallback onDateFilter;

  const SolicitudTableToolbar({
    super.key,
    required this.currentTabIndex,
    required this.viewType,
    required this.onTabChanged,
    required this.onViewChanged,
    required this.onExport,
    required this.onDateFilter,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 900;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Listado de Solicitudes',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF111827),
              ),
            ),
            const SizedBox(height: 12),

            isMobile
                ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SolicitudTabsFilter(
                  selectedIndex: currentTabIndex,
                  onChanged: onTabChanged,
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    _SolicitudActionButton(
                      icon: Icons.calendar_today_outlined,
                      label: 'Filtrar por fecha',
                      onPressed: onDateFilter,
                    ),
                    _SolicitudActionButton(
                      icon: Icons.download_outlined,
                      label: 'Descargar',
                      onPressed: onExport,
                    ),
                    ViewToggleGroup(
                      current: viewType,
                      onChanged: onViewChanged,
                    ),
                  ],
                ),
              ],
            )
                : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SolicitudTabsFilter(
                  selectedIndex: currentTabIndex,
                  onChanged: onTabChanged,
                ),
                Row(
                  children: [
                    _SolicitudActionButton(
                      icon: Icons.calendar_today_outlined,
                      label: 'Filtrar por fecha',
                      onPressed: onDateFilter,
                    ),
                    const SizedBox(width: 8),
                    _SolicitudActionButton(
                      icon: Icons.download_outlined,
                      label: 'Descargar',
                      onPressed: onExport,
                    ),
                    const SizedBox(width: 8),
                    ViewToggleGroup(
                      current: viewType,
                      onChanged: onViewChanged,
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}


class _SolicitudActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const _SolicitudActionButton({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 16, color: const Color(0xFF374151)),
      label: Text(
        label,
        style: const TextStyle(
          fontSize: 13,
          color: Color(0xFF374151),
        ),
      ),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        side: const BorderSide(color: Color(0xFFD1D5DB)),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
    );
  }
}