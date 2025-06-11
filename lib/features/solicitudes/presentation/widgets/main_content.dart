import 'package:flutter/material.dart';
import 'package:reto_atiksoluciones/core/shared/widgets/section_title_header.dart';
import 'package:reto_atiksoluciones/features/solicitudes/data/mocks/mock_solicitudes.dart';
import 'package:reto_atiksoluciones/features/solicitudes/data/models/solicitud_model.dart';
import 'package:reto_atiksoluciones/features/solicitudes/presentation/widgets/section_filters.dart';
import 'package:reto_atiksoluciones/features/solicitudes/presentation/widgets/section_summary_container.dart';
import 'package:reto_atiksoluciones/features/solicitudes/presentation/widgets/section_table.dart';

class MainContent extends StatefulWidget {
  const MainContent({super.key});

  @override
  State<MainContent> createState() => _MainContentState();
}

class _MainContentState extends State<MainContent> {
  String _search = '';
  int _tabIndex = 0;

  List<SolicitudModel> get _filteredSolicitudes {
    final estado = switch (_tabIndex) {
      0 => null, // Todas
      1 => 'Pendiente',
      2 => 'Aprobada',
      3 => 'Rechazada',
      _ => null,
    };

    return mockSolicitudesData
        .where((s) =>
    (estado == null || s.estado == estado) &&
        s.nombreEmpleado.toLowerCase().contains(_search.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SectionTitleHeader(
                  title: 'Solicitudes',
                  subtitle: 'Gestiona todas tus solicitudes desde aquí',
                  actionText: 'Nueva solicitud',
                  onActionPressed: null,
                  showBack: true,
                ),
                SizedBox(height: 24),
                SectionFilters(),
                SizedBox(height: 24),
                SectionSummaryContainer(),
                SizedBox(height: 24),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: SectionTable(
              tabIndex: _tabIndex,
              onTabChanged: (index) => setState(() => _tabIndex = index),
              solicitudes: _filteredSolicitudes,
            ),
          ),
        ],
      ),
    );
  }

}