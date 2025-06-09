import 'package:flutter/material.dart';
import 'package:reto_atiksoluciones/features/solicitudes/presentation/widgets/solicitud_card_view.dart';
import 'package:reto_atiksoluciones/features/solicitudes/presentation/widgets/solicitud_footer.dart';
import 'package:reto_atiksoluciones/features/solicitudes/presentation/widgets/solicitud_table_view.dart';
import 'package:reto_atiksoluciones/features/solicitudes/presentation/widgets/solicitud_tabs_filter.dart';
import 'package:reto_atiksoluciones/features/solicitudes/presentation/widgets/solicitud_toolbar.dart';

enum SolicitudViewType { table, cards }

class SectionTable extends StatefulWidget {
  const SectionTable({super.key});

  @override
  State<SectionTable> createState() => _SectionTableState();
}

class _SectionTableState extends State<SectionTable> {
  SolicitudViewType _view = SolicitudViewType.table;
  int _currentTabIndex = 0;
  int _rowsPerPage = 10;
  int _currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      padding: const EdgeInsets.all(20),
      width: double.infinity, // Ocupa todo el ancho disponible del layout padre
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Título + Tabs + Acciones
          Column(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SolicitudTabsFilter(
                    selectedIndex: _currentTabIndex,
                    onChanged: (index) => setState(() => _currentTabIndex = index),
                  ),
                  Row(
                    children: [
                      _SolicitudButton(
                        icon: Icons.calendar_today_outlined,
                        label: 'Filtrar por fecha',
                        onPressed: () {},
                      ),
                      const SizedBox(width: 8),
                      _SolicitudButton(
                        icon: Icons.download_outlined,
                        label: 'Descargar',
                        onPressed: () {},
                      ),
                      const SizedBox(width: 8),
                      _ViewToggleGroup(
                        current: _view,
                        onChanged: (type) => setState(() => _view = type),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Toolbar adicional
          // SolicitudToolbar(
          //   onExport: () {},
          //   onFilterDate: () {},
          // ),
          // const SizedBox(height: 16),

          // Contenido
          _view == SolicitudViewType.table
              ? const SolicitudTableView()
              : const SolicitudCardView(),
          const SizedBox(height: 16),

          // Footer paginación
          SolicitudFooter(
            currentPage: _currentPage,
            rowsPerPage: _rowsPerPage,
            totalItems: 17,
            onPageChanged: (page) => setState(() => _currentPage = page),
            onRowsChanged: (rows) => setState(() {
              _rowsPerPage = rows;
              _currentPage = 1;
            }),
          ),
        ],
      ),
    );
  }
}


class _SolicitudButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const _SolicitudButton({
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

class _ViewToggleGroup extends StatelessWidget {
  final SolicitudViewType current;
  final ValueChanged<SolicitudViewType> onChanged;

  const _ViewToggleGroup({
    required this.current,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          _ViewToggleButton(
            icon: Icons.view_list,
            isSelected: current == SolicitudViewType.table,
            onTap: () => onChanged(SolicitudViewType.table),
          ),
          _ViewToggleButton(
            icon: Icons.grid_view_rounded,
            isSelected: current == SolicitudViewType.cards,
            onTap: () => onChanged(SolicitudViewType.cards),
          ),
        ],
      ),
    );
  }
}

class _ViewToggleButton extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _ViewToggleButton({
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 2),
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF0061F2) : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Icon(
          icon,
          size: 18,
          color: isSelected ? Colors.white : const Color(0xFF374151),
        ),
      ),
    );
  }
}

