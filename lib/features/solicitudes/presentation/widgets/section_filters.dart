import 'package:flutter/material.dart';
import 'package:reto_atiksoluciones/core/shared/widgets/filters/base_filters_section.dart';
import 'package:reto_atiksoluciones/features/solicitudes/domain/models/filter_group_data.dart';
import 'package:reto_atiksoluciones/features/solicitudes/presentation/widgets/filter_advanced_panel.dart';

class SectionFilters extends StatefulWidget {
  const SectionFilters({super.key});

  @override
  State<SectionFilters> createState() => _SectionFiltersState();
}

class _SectionFiltersState extends State<SectionFilters> {
  String _searchQuery = '';
  late List<FilterGroupData> _filterGroups;

  @override
  void initState() {
    super.initState();
    _filterGroups = [
      FilterGroupData(
        title: 'TIPOS DE SOLICITUD',
        items: ['Vacaciones', 'Permiso', 'Cambio puesto'],
        selected: {},
      ),
      FilterGroupData(
        title: 'ESTADOS',
        items: ['Pendiente', 'Aprobada', 'Rechazada'],
        selected: {},
      ),
    ];
  }

  void _onSearchChanged(String value) {
    setState(() {
      _searchQuery = value;
    });
  }

  void _onGroupChanged(int index, Set<String> selected) {
    setState(() {
      _filterGroups[index] = _filterGroups[index].copyWith(selected: selected);
    });
  }

  void _onClearFilters() {
    setState(() {
      _searchQuery = '';
      _filterGroups = _filterGroups
          .map((group) => group.copyWith(selected: {}))
          .toList();
    });
  }

  void _onApplyFilters() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return BaseFiltersSection(
      searchHint: 'Buscar solicitudes...',
      onSearchChanged: _onSearchChanged,
      onApplyFilters: _onApplyFilters,
      onClearFilters: _onClearFilters,
      advancedFilterPanel: FilterAdvancedPanel(
        groups: _filterGroups,
        onGroupChanged: _onGroupChanged,
        onApply: _onApplyFilters,
        onClear: _onClearFilters,
      ),
    );
  }
}