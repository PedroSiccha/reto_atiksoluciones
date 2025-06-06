import 'package:flutter/material.dart';

class SidebarSection extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isExpanded;
  final bool isActive;
  final bool isHovered;
  final bool showToggleIcon;
  final bool isCollapsed;
  final VoidCallback? onTap;

  const SidebarSection({
    super.key,
    required this.title,
    required this.icon,
    this.isExpanded = false,
    this.isActive = false,
    this.isHovered = false,
    this.showToggleIcon = false,
    this.isCollapsed = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isActive
        ? Colors.white.withOpacity(0.1)
        : isHovered
        ? Colors.white.withOpacity(0.033)
        : Colors.transparent;

    final borderLeft = isActive || isHovered
        ? const Border(
      left: BorderSide(color: Colors.white, width: 4),
    )
        : null;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        borderRadius: BorderRadius.circular(6),
        onTap: onTap,
        child: Container(
          height: 44,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(6),
            border: borderLeft,
          ),
          child: Row(
            children: [
              Icon(icon, color: Colors.white, size: 20),
              if (!isCollapsed) ...[
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
                if (showToggleIcon)
                  Icon(
                    isExpanded ? Icons.expand_less : Icons.expand_more,
                    size: 16,
                    color: Colors.white,
                  ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}