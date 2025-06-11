import 'package:flutter/material.dart';
import 'package:reto_atiksoluciones/core/layout/widgets/app_sidebar.dart';
import 'package:reto_atiksoluciones/features/sidebar/data/models/menu_sub_item.dart';
import 'package:reto_atiksoluciones/features/sidebar/presentation/controllers/sidebar_controller.dart';
import 'package:reto_atiksoluciones/features/sidebar/data/models/menu_section.dart';

class SidebarWidget extends StatefulWidget {
  const SidebarWidget({super.key});

  @override
  State<SidebarWidget> createState() => _SidebarWidgetState();
}

class _SidebarWidgetState extends State<SidebarWidget> {
  late final SidebarController controller;
  late final List<MenuSection> sections;

  @override
  void initState() {
    super.initState();
    controller = SidebarController();
    sections = [
      MenuSection(title: "Portal del Empleado", icon: Icons.folder, children: [
        MenuSubItem(title: "Solicitudes", icon: Icons.description),
        MenuSubItem(title: "Comprobantes de Pago", icon: Icons.receipt_long),
        MenuSubItem(title: "Informe de Cursos", icon: Icons.school),
      ]),
      MenuSection(title: "Cola de Aprobación", icon: Icons.list_alt),
      MenuSection(title: "Reclutamiento", icon: Icons.work),
      MenuSection(title: "Portal del Candidato", icon: Icons.folder_shared),
      MenuSection(title: "Evaluación de desempeño", icon: Icons.bar_chart),
      MenuSection(title: "Consolidación", icon: Icons.calculate),
      MenuSection(title: "Cálculos Impositivos", icon: Icons.receipt),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        return AppSidebar(
          isCollapsed: controller.isCollapsed,
          sections: sections,
          selectedSectionIndex: controller.selectedSectionIndex,
          selectedSubItem: controller.selectedSubItem,
          expandedIndex: controller.expandedIndex,
          hoveredSectionIndex: controller.hoveredSectionIndex,
          hoveredSubItem: controller.hoveredSubItem,
          onToggleCollapse: controller.toggleCollapse,
          onSectionTap: (index) => controller.selectSection(index, sections),
          onSubItemTap: controller.selectSubItem,
          onHoverSection: controller.hoverSection,
          onExitHoverSection: controller.clearHoverSection,
          onHoverSubItem: controller.hoverSubItem,
          onExitHoverSubItem: controller.clearHoverSubItem,
        );
      },
    );
  }
}