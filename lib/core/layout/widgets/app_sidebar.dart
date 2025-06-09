import 'package:flutter/material.dart';
import 'package:reto_atiksoluciones/core/constants/app_colors.dart';
import 'package:reto_atiksoluciones/features/sidebar/data/models/menu_section.dart';
import 'package:reto_atiksoluciones/features/sidebar/presentation/widgets/sidebar_header.dart';
import 'package:reto_atiksoluciones/features/sidebar/presentation/widgets/sidebar_item.dart';
import 'package:reto_atiksoluciones/features/sidebar/presentation/widgets/sidebar_section.dart';
import 'package:reto_atiksoluciones/features/sidebar/presentation/widgets/sidebar_user_card.dart';

class AppSidebar extends StatelessWidget {
  final bool isCollapsed;
  final List<MenuSection> sections;
  final void Function() onToggleCollapse;
  final void Function(int index) onSectionTap;
  final void Function(int sectionIndex, int itemIndex) onSubItemTap;
  final int? selectedSectionIndex;
  final ({int section, int index})? selectedSubItem;
  final int? expandedIndex;
  final int? hoveredSectionIndex;
  final ({int section, int index})? hoveredSubItem;
  final void Function(int index)? onHoverSection;
  final void Function()? onExitHoverSection;
  final void Function(int sectionIndex, int itemIndex)? onHoverSubItem;
  final void Function()? onExitHoverSubItem;

  const AppSidebar({
    super.key,
    required this.isCollapsed,
    required this.sections,
    required this.onToggleCollapse,
    required this.onSectionTap,
    required this.onSubItemTap,
    required this.selectedSectionIndex,
    required this.selectedSubItem,
    required this.expandedIndex,
    required this.hoveredSectionIndex,
    required this.hoveredSubItem,
    required this.onHoverSection,
    required this.onExitHoverSection,
    required this.onHoverSubItem,
    required this.onExitHoverSubItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isCollapsed ? 90 : 260,
      height: double.infinity,
      color: AppColors.sidebar,
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          SidebarHeader(isCollapsed: isCollapsed, onToggle: onToggleCollapse),
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
                      onEnter: (_) => onHoverSection?.call(index),
                      onExit: (_) => onExitHoverSection?.call(),
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
                            final isSubActive = selectedSubItem?.section == index &&
                                selectedSubItem?.index == subIndex;
                            final isSubHovered = hoveredSubItem?.section == index &&
                                hoveredSubItem?.index == subIndex;

                            return MouseRegion(
                              onEnter: (_) => onHoverSubItem?.call(index, subIndex),
                              onExit: (_) => onExitHoverSubItem?.call(),
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