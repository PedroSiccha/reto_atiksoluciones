import 'package:flutter/material.dart';

class SolicitudCardView extends StatelessWidget {
  const SolicitudCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          height: constraints.maxHeight,
          child: GridView.builder(
            padding: const EdgeInsets.only(bottom: 16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // se hará responsive después
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 2.8,
            ),
            itemCount: 6, // simulado
            itemBuilder: (context, index) {
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
                    // Tipo + Estado
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.beach_access, color: Color(0xFF2563EB), size: 18),
                            SizedBox(width: 6),
                            Text(
                              'Vacaciones',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Color(0xFF111827),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Color(0xFFFEF3C7),
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
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    // Empleado y datos
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Parte izquierda
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text.rich(
                                  TextSpan(children: [
                                    TextSpan(text: 'Empleado: ', style: TextStyle(fontWeight: FontWeight.w500)),
                                    TextSpan(text: 'María Rodríguez (Código 001)'),
                                  ]),
                                  style: TextStyle(fontSize: 13),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Departamento: Recepción',
                                  style: TextStyle(fontSize: 12, color: Color(0xFF6B7280)),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Fecha Solicitud: 15/03/2025',
                                  style: TextStyle(fontSize: 12, color: Color(0xFF6B7280)),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Período: 01/04/2025 - 15/04/2025',
                                  style: TextStyle(fontSize: 12, color: Color(0xFF6B7280)),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(width: 12),

                          // Parte derecha
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Empresa: Grupo Puntacana',
                                  style: TextStyle(fontSize: 12, color: Color(0xFF6B7280)),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Sucursal: Punta Cana',
                                  style: TextStyle(fontSize: 12, color: Color(0xFF6B7280)),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Solicitado: hace 3 días',
                                  style: TextStyle(fontSize: 12, color: Color(0xFF6B7280)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Acciones
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
          ),
        );
      },
    );
  }
}