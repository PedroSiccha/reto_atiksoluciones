import 'package:flutter/material.dart';
import 'package:reto_atiksoluciones/features/solicitudes/data/models/solicitud_model.dart';
import 'package:reto_atiksoluciones/features/solicitudes/domain/models/solicitud_view_type.dart';
import 'package:reto_atiksoluciones/features/solicitudes/presentation/widgets/table/solicitud_card_view.dart';
import 'package:reto_atiksoluciones/features/solicitudes/presentation/widgets/table/solicitud_footer.dart';
import 'package:reto_atiksoluciones/features/solicitudes/presentation/widgets/table/solicitud_table_toolbar.dart';
import 'package:reto_atiksoluciones/features/solicitudes/presentation/widgets/table/solicitud_table_view.dart';

class SectionTable extends StatefulWidget {
  final int tabIndex;
  final ValueChanged<int> onTabChanged;
  final List<SolicitudModel> solicitudes;
  const SectionTable({
    super.key,
    required this.tabIndex,
    required this.onTabChanged,
    required this.solicitudes,
  });

  @override
  State<SectionTable> createState() => _SectionTableState();
}

class _SectionTableState extends State<SectionTable> {
  SolicitudViewType _view = SolicitudViewType.table;
  int _rowsPerPage = 10;
  int _currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SolicitudTableToolbar(
            currentTabIndex: widget.tabIndex,
            viewType: _view,
            onTabChanged: widget.onTabChanged,
            onViewChanged: (type) => setState(() => _view = type),
            onExport: () {},
            onDateFilter: () {},
          ),
          const SizedBox(height: 16),
          _view == SolicitudViewType.table
              ? SolicitudTableView(data: widget.solicitudes)
              : SolicitudCardView(data: widget.solicitudes),
          const SizedBox(height: 16),
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