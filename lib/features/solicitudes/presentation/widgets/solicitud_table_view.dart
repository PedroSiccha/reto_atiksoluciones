import 'package:flutter/material.dart';

class SolicitudTableView extends StatelessWidget {
  const SolicitudTableView({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: constraints.maxWidth),
              child: IntrinsicWidth(
                child: DataTable(
                  headingRowHeight: 56,
                  dataRowMinHeight: 56,
                  dataRowMaxHeight: 64,
                  dataRowColor: MaterialStateProperty.resolveWith<Color?>((states) {
                    if (states.contains(MaterialState.hovered)) {
                      return const Color(0xFFF9FAFB); // fondo al pasar el mouse
                    }
                    return Colors.transparent;
                  }),
                  headingRowColor: MaterialStateProperty.all(
                    const Color(0xFFF9FAFB), // fondo gris claro para header
                  ),
                  headingTextStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF374151),
                  ),
                  columnSpacing: 16,
                  horizontalMargin: 16,
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
                  rows: List.generate(10, (index) {
                    return DataRow.byIndex(
                      index: index,
                      cells: [
                        DataCell(Text('0000${index + 1}')),
                      
                        // TIPO
                        DataCell(
                          SizedBox(
                            width: 200,
                            child: _TipoCell(
                              tipo: 'Vacaciones',
                              fecha: '15/03/2025',
                            ),
                          ),
                        ),
                      
                      
                        // EMPLEADO
                        DataCell(
                          SizedBox(
                            width: 180,
                            child: _EmpleadoCell(
                              nombre: 'María Rodríguez',
                              codigo: '001',
                              area: 'Recepción',
                            ),
                          ),
                        ),
                      
                      
                        // PERIODO
                        const DataCell(Text('01/04/2025 al 15/04/2025')),
                      
                        // EMPRESA/SUCURSAL
                        DataCell(Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text('Grupo Puntacana'),
                            Text(
                              'Puntacana Resort & Club',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF9CA3AF),
                              ),
                            ),
                          ],
                        )),
                      
                        // SOLICITADO
                        const DataCell(Text('hace 85 días')),
                      
                        // ESTADO
                        DataCell(Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFEF3C7),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            'Pendiente',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFF59E0B),
                            ),
                          ),
                        )),
                      
                        // ACCIONES
                        DataCell(
                          SizedBox(
                            width: 200,
                            child: _AccionesCell(
                              onView: () => print('Ver detalles'),
                              onEditar: () => print('Editar'),
                              onDescargar: () => print('Descargar'),
                              onAprobar: () => print('Aprobar'),
                              onRechazar: () => print('Rechazar'),
                            ),
                          ),
                        ),
                      
                      ],
                    );
                  }),
                ),
              ),
            ),
          );
        },
      ),
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

  IconData _getIconByTipo(String tipo) {
    switch (tipo.toLowerCase()) {
      case 'vacaciones':
        return Icons.beach_access;
      case 'permiso':
        return Icons.calendar_today;
      case 'licencia médica':
        return Icons.local_hospital;
      case 'cambio alojamiento':
        return Icons.meeting_room;
      case 'uniformes':
        return Icons.checkroom;
      default:
        return Icons.label;
    }
  }

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
                color: const Color(0xFFE0EDFF),
                shape: BoxShape.circle,
              ),
              child: Icon(
                _getIconByTipo(tipo),
                size: 16,
                color: const Color(0xFF0061F2),
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
