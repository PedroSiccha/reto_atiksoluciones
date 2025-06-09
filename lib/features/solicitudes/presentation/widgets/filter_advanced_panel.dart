import 'package:flutter/material.dart';

class FilterAdvancedPanel extends StatelessWidget {
  final VoidCallback onClear;
  final VoidCallback onApply;

  const FilterAdvancedPanel({
    super.key,
    required this.onClear,
    required this.onApply,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.all(0),
      child: SizedBox(
        width: 320,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Filtros avanzados',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Color(0xFF111827),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: onClear,
                    style: TextButton.styleFrom(
                      foregroundColor: const Color(0xFF0061F2),
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(0, 30),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: const Text(
                      'Limpiar',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              ),

              const Divider(color: Color(0xFFE5E7EB)),

              const SizedBox(height: 8),

              // Filtro: Tipos de solicitud
              const _FilterGroup(
                title: 'TIPOS DE SOLICITUD',
                items: ['Vacaciones', 'Permiso', 'Cambio puesto'],
              ),
              const SizedBox(height: 12),

              // Filtro: Estados
              const _FilterGroup(
                title: 'ESTADOS',
                items: ['Pendiente', 'Aprobada', 'Rechazada'],
              ),
              const SizedBox(height: 12),

              // Aquí seguirán más grupos...

              const SizedBox(height: 16),

              // Botón aplicar filtros
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onApply,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0061F2),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    textStyle: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  child: const Text('Aplicar filtros'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FilterGroup extends StatefulWidget {
  final String title;
  final List<String> items;

  const _FilterGroup({required this.title, required this.items});

  @override
  State<_FilterGroup> createState() => _FilterGroupState();
}

class _FilterGroupState extends State<_FilterGroup> {
  bool isExpanded = false;
  final Set<String> selected = {};

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            widget.title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Color(0xFF374151),
            ),
          ),
          trailing: Icon(
            isExpanded ? Icons.expand_less : Icons.expand_more,
            color: const Color(0xFF9CA3AF),
          ),
          onTap: () => setState(() => isExpanded = !isExpanded),
        ),
        if (isExpanded)
          Column(
            children: widget.items
                .map(
                  (item) => CheckboxListTile(
                value: selected.contains(item),
                contentPadding: EdgeInsets.zero,
                title: Text(item),
                onChanged: (checked) {
                  setState(() {
                    if (checked == true) {
                      selected.add(item);
                    } else {
                      selected.remove(item);
                    }
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
            )
                .toList(),
          )
      ],
    );
  }
}