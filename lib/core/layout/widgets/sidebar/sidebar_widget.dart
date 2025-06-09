import 'package:flutter/material.dart';
import 'package:reto_atiksoluciones/core/constants/app_colors.dart';
import 'package:reto_atiksoluciones/core/layout/widgets/sidebar/components/menu_section.dart';
import 'package:reto_atiksoluciones/core/layout/widgets/sidebar/components/menu_sub_item.dart';
import 'package:reto_atiksoluciones/core/layout/widgets/sidebar/components/sidebar_header.dart';
import 'package:reto_atiksoluciones/core/layout/widgets/sidebar/components/sidebar_item.dart';
import 'package:reto_atiksoluciones/core/layout/widgets/sidebar/components/sidebar_section.dart';
import 'package:reto_atiksoluciones/core/layout/widgets/sidebar/components/sidebar_user_card.dart';

class SidebarWidget extends StatefulWidget {
  const SidebarWidget({super.key});

  @override
  State<SidebarWidget> createState() => _SidebarWidgetState();
}

class _SidebarWidgetState extends State<SidebarWidget> {
  int? selectedSectionIndex;
  ({int section, int index})? selectedSubItem;
  int? expandedIndex;
  int? hoveredSectionIndex;
  ({int section, int index})? hoveredSubItem;
  bool isCollapsed = false;

  final List<MenuSection> sections = [
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

  void onSectionTap(int index) {
    setState(() {
      selectedSectionIndex = index;
      selectedSubItem = null;
      if (sections[index].children.isNotEmpty) {
        expandedIndex = expandedIndex == index ? null : index;
      }
    });
  }

  void onSubItemTap(int sectionIndex, int itemIndex) {
    setState(() {
      selectedSubItem = (section: sectionIndex, index: itemIndex);
      selectedSectionIndex = sectionIndex;
    });
  }

  void toggleCollapse() {
    setState(() {
      isCollapsed = !isCollapsed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isCollapsed ? 90 : 260,
      height: double.infinity,
      color: AppColors.sidebar,
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          SidebarHeader(
            isCollapsed: isCollapsed,
            onToggle: toggleCollapse,
          ),
          const SizedBox(height: 12),
          if (!isCollapsed) const SidebarUserCard(),
          const Divider(color: Colors.white24, indent: 24, endIndent: 24),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: sections.length,
              itemBuilder: (context, index) {
                final section = sections[index];
                final isActive = selectedSectionIndex == index;
                final isExpanded = expandedIndex == index;
                final isHovered = hoveredSectionIndex == index;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MouseRegion(
                      onEnter: (_) => setState(() => hoveredSectionIndex = index),
                      onExit: (_) => setState(() => hoveredSectionIndex = null),
                      child: SidebarSection(
                        title: section.title,
                        icon: section.icon,
                        isActive: isActive,
                        isExpanded: isExpanded,
                        isHovered: isHovered,
                        showToggleIcon: section.children.isNotEmpty,
                        onTap: () => onSectionTap(index),
                        isCollapsed: isCollapsed,
                      ),
                    ),
                    if (isExpanded && !isCollapsed)
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Column(
                          children: List.generate(section.children.length, (subIndex) {
                            final item = section.children[subIndex];
                            final isSubActive = selectedSubItem?.section == index && selectedSubItem?.index == subIndex;
                            final isSubHovered = hoveredSubItem?.section == index && hoveredSubItem?.index == subIndex;

                            return MouseRegion(
                              onEnter: (_) => setState(() => hoveredSubItem = (section: index, index: subIndex)),
                              onExit: (_) => setState(() => hoveredSubItem = null),
                              child: SidebarItem(
                                title: item.title,
                                icon: item.icon,
                                isActive: isSubActive,
                                isHovered: isSubHovered,
                                onTap: () => onSubItemTap(index, subIndex),
                                isCollapsed: isCollapsed,
                              ),
                            );
                          }),
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
          const Divider(color: Colors.white24, indent: 24, endIndent: 24),
          SidebarSection(title: "Ayuda y Soporte", icon: Icons.help_outline, isActive: false, isHovered: false, isCollapsed: isCollapsed),
          SidebarSection(title: "Configuración", icon: Icons.settings, isActive: false, isHovered: false, isCollapsed: isCollapsed),
          SidebarSection(title: "Cerrar Sesión", icon: Icons.logout, isActive: false, isHovered: false, isCollapsed: isCollapsed),
        ],
      ),
    );
  }
}