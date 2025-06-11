import 'package:flutter/material.dart';
import 'package:reto_atiksoluciones/core/shared/widgets/helpers/estado_chip.dart.dart';
import 'package:reto_atiksoluciones/core/shared/widgets/table/base_data_table.dart';
import 'package:reto_atiksoluciones/features/solicitudes/data/models/solicitud_model.dart';
import 'package:reto_atiksoluciones/core/shared/widgets/helpers/solicitud_tipo_icon.dart';

class SolicitudTableView extends StatelessWidget {
  final List<SolicitudModel> data;
  const SolicitudTableView({
    super.key,
    required this.data
  });

  @override
  Widget build(BuildContext context) {
    return BaseDataTable(
      columns: const [
        DataColumn(label: Text('Código')),
        DataColumn(label: Text('Tipo')),
        DataColumn(label: Text('Empleado')),
        DataColumn(label: Text('Periodo')),
        DataColumn(label: Text('Empresa/Sucursal')),
        DataColumn(label: Text('Solicitado')),
        DataColumn(label: Text('Estado')),
        DataColumn(label: Text('Acciones')),
      ],
      rows: List.generate(data.length, (index) {
        final item = data[index];
        return DataRow.byIndex(
          index: index,
          cells: [
            DataCell(Text(item.codigo)),
            DataCell(
                ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: 180),
                  child: _TipoCell(tipo: item.tipo, fecha: item.fechaTipo),
                )
            ),
            DataCell(
                ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: 180),
                  child: _EmpleadoCell(
                    nombre: item.nombreEmpleado,
                    codigo: item.codigoEmpleado,
                    area: item.areaEmpleado,
                  ),
                )
            ),
            DataCell(Text(item.periodo)),
            DataCell(Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.empresa),
                Text(
                  item.sucursal,
                  style: const TextStyle(fontSize: 12, color: Color(0xFF9CA3AF)),
                ),
              ],
            )),
            DataCell(Text(item.solicitado)),
            DataCell(EstadoChip(estado: item.estado)),
            DataCell(
                ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: 180),
                  child: _AccionesCell(
                    onView: () => print('Ver detalles'),
                    onEditar: () => print('Editar'),
                    onDescargar: () => print('Descargar'),
                    onAprobar: () => print('Aprobar'),
                    onRechazar: () => print('Rechazar'),
                  ),
                )
            ),
          ],
        );
      }),
    );
  }
}

class _EmpleadoCell extends StatefulWidget {
  final String nombre;
  final String codigo;
  final String area;

  const _EmpleadoCell({
    required this.nombre,
    required this.codigo,
    required this.area,
  });

  @override
  State<_EmpleadoCell> createState() => _EmpleadoCellState();
}

class _EmpleadoCellState extends State<_EmpleadoCell> {
  bool _hovered = false;

  void _openModal() {
    showDialog(
      context: context,
      builder: (_) => const _EmpleadoModal(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: _openModal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.nombre,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: _hovered ? const Color(0xFF1D4ED8) : const Color(0xFF111827),
                decoration:
                _hovered ? TextDecoration.underline : TextDecoration.none,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              'Código ${widget.codigo}\n${widget.area}',
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF9CA3AF),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmpleadoModal extends StatelessWidget {
  const _EmpleadoModal();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: SizedBox(
        width: 600,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                'Información del Empleado',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 16),
              Text('Aquí va el contenido detallado como en la imagen.'),
            ],
          ),
        ),
      ),
    );
  }
}

class _AccionesCell extends StatelessWidget {
  final VoidCallback onView;
  final VoidCallback onEditar;
  final VoidCallback onDescargar;
  final VoidCallback onAprobar;
  final VoidCallback onRechazar;

  const _AccionesCell({
    required this.onView,
    required this.onEditar,
    required this.onDescargar,
    required this.onAprobar,
    required this.onRechazar,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton.icon(
          onPressed: onView,
          icon: const Icon(Icons.visibility_outlined, size: 14),
          label: const Text('Ver detalles'),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFF3F4F6),
            foregroundColor: const Color(0xFF111827),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            textStyle: const TextStyle(fontSize: 12),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
        const SizedBox(width: 4),
        PopupMenuButton<String>(
          icon: const Icon(Icons.more_horiz),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          onSelected: (value) {
            switch (value) {
              case 'editar':
                onEditar();
                break;
              case 'descargar':
                onDescargar();
                break;
              case 'aprobar':
                onAprobar();
                break;
              case 'rechazar':
                onRechazar();
                break;
            }
          },
          itemBuilder: (context) => [
            PopupMenuItem<String>(
              value: 'editar',
              child: Row(
                children: const [
                  Icon(Icons.edit_outlined, size: 16),
                  SizedBox(width: 8),
                  Text('Editar'),
                ],
              ),
            ),
            PopupMenuItem<String>(
              value: 'descargar',
              child: Row(
                children: const [
                  Icon(Icons.download_outlined, size: 16),
                  SizedBox(width: 8),
                  Text('Descargar'),
                ],
              ),
            ),
            PopupMenuItem<String>(
              value: 'aprobar',
              child: Row(
                children: const [
                  Icon(Icons.check_circle_outline, size: 16, color: Colors.green),
                  SizedBox(width: 8),
                  Text('Aprobar'),
                ],
              ),
            ),
            PopupMenuItem<String>(
              value: 'rechazar',
              child: Row(
                children: const [
                  Icon(Icons.cancel_outlined, size: 16, color: Colors.red),
                  SizedBox(width: 8),
                  Text('Rechazar'),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _TipoCell extends StatelessWidget {
  final String tipo;
  final String fecha;

  const _TipoCell({
    required this.tipo,
    required this.fecha,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: SolicitudTipoIcon.getBackground(tipo),
                shape: BoxShape.circle,
              ),
              child: Icon(
                SolicitudTipoIcon.getIcon(tipo),
                size: 16,
                color: SolicitudTipoIcon.getColor(tipo),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tipo,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF111827),
                  ),
                ),
                Text(
                  fecha,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF9CA3AF),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
