import 'package:flutter/material.dart';
import 'package:reto_atiksoluciones/core/shared/widgets/helpers/estado_chip.dart.dart';
import 'package:reto_atiksoluciones/features/solicitudes/data/models/solicitud_model.dart';
import 'package:reto_atiksoluciones/core/shared/widgets/helpers/solicitud_tipo_icon.dart';

class SolicitudCardView extends StatelessWidget {
  final List<SolicitudModel> data;

  const SolicitudCardView({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;

        int crossAxisCount = 1;
        if (screenWidth > 1400) {
          crossAxisCount = 3;
        } else if (screenWidth > 900) {
          crossAxisCount = 2;
        }

        return GridView.builder(
          padding: const EdgeInsets.only(bottom: 16),
          shrinkWrap: true,
          itemCount: data.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 2.5,
          ),
          itemBuilder: (context, index) {
            final solicitud = data[index];
            return Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: const Color(0xFFE5E7EB)),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: SolicitudTipoIcon.getBackground(solicitud.tipo),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              SolicitudTipoIcon.getIcon(solicitud.tipo),
                              size: 16,
                              color: SolicitudTipoIcon.getColor(solicitud.tipo),
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            solicitud.tipo,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Color(0xFF111827),
                            ),
                          ),
                        ],
                      ),
                      EstadoChip(estado: solicitud.estado),
                    ],
                  ),

                  const SizedBox(height: 12),
                  Flexible(
                    fit: FlexFit.loose,
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text.rich(
                                TextSpan(children: [
                                  const TextSpan(
                                      text: 'Empleado: ',
                                      style: TextStyle(fontWeight: FontWeight.w500)),
                                  TextSpan(
                                      text:
                                      '${solicitud.nombreEmpleado} (Código ${solicitud.codigoEmpleado})'),
                                ]),
                                style: const TextStyle(fontSize: 11),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Departamento: ${solicitud.areaEmpleado}',
                                style: const TextStyle(fontSize: 12, color: Color(0xFF6B7280)),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Fecha Solicitud: ${solicitud.fechaTipo}',
                                style: const TextStyle(fontSize: 12, color: Color(0xFF6B7280)),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Período: ${solicitud.periodo}',
                                style: const TextStyle(fontSize: 12, color: Color(0xFF6B7280)),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Empresa: ${solicitud.empresa}',
                                style: const TextStyle(fontSize: 12, color: Color(0xFF6B7280)),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Sucursal: ${solicitud.sucursal}',
                                style: const TextStyle(fontSize: 12, color: Color(0xFF6B7280)),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Solicitado: ${solicitud.solicitado}',
                                style: const TextStyle(fontSize: 12, color: Color(0xFF6B7280)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.visibility_outlined, size: 14),
                        label: const Text('Ver detalles'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF3F4F6),
                          foregroundColor: const Color(0xFF111827),
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                          textStyle: const TextStyle(fontSize: 12),
                          elevation: 0,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.more_horiz),
                      )
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

}