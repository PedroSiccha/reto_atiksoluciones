import 'package:flutter/material.dart';

class SidebarHeader extends StatelessWidget {
  final bool isCollapsed;
  final VoidCallback onToggle;

  const SidebarHeader({
    super.key,
    required this.isCollapsed,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child: const Text(
              "HT",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0061F2),
              ),
            ),
          ),
          if (!isCollapsed) ...[
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                "Ho-Tech",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
          IconButton(
            onPressed: onToggle,
            icon: Icon(
              isCollapsed ? Icons.chevron_right : Icons.chevron_left,
              color: Colors.white,
              size: 20,
            ),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 25, minHeight: 40),
            tooltip: isCollapsed ? "Expandir" : "Colapsar",
          ),
        ],
      ),
    );
  }
}
