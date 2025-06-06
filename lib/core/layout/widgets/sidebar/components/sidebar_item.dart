import 'package:flutter/material.dart';

class SidebarItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isActive;
  final bool isHovered;
  final bool isCollapsed;
  final VoidCallback? onTap;

  const SidebarItem({
    super.key,
    required this.title,
    required this.icon,
    this.isActive = false,
    this.isHovered = false,
    this.isCollapsed = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isActive
        ? Colors.white.withOpacity(0.1)
        : isHovered
        ? Colors.white.withOpacity(0.05)
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
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(6),
              border: borderLeft,
            ),
            child: Row(
              children: [
                Icon(icon, color: Colors.white, size: 18),
                if (!isCollapsed) ...[
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}