import 'package:flutter/material.dart';
import 'package:reto_atiksoluciones/core/constants/app_colors.dart';
import 'package:reto_atiksoluciones/core/constants/app_sizes.dart';
import 'package:reto_atiksoluciones/core/constants/app_text_styles.dart';

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
    final Color backgroundColor = isActive
        ? AppColors.background.withOpacity(0.1)
        : isHovered
        ? AppColors.background.withOpacity(0.05)
        : Colors.transparent;

    final Border border = isActive || isHovered
        ? const Border(
      left: BorderSide(color: AppColors.background, width: 4),
    )
        : Border.fromBorderSide(BorderSide.none);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        borderRadius: BorderRadius.circular(AppSizes.sm),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.xs),
          child: Container(
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.lg),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(AppSizes.sm),
              border: border,
            ),
            child: Row(
              children: [
                Icon(icon, color: AppColors.background, size: 18),
                if (!isCollapsed) ...[
                  const SizedBox(width: AppSizes.sm),
                  Expanded(
                    child: Text(
                      title,
                      style: AppTextStyles.sidebarItem,
                      overflow: TextOverflow.ellipsis,
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