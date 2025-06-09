import 'package:flutter/material.dart';
import 'package:reto_atiksoluciones/core/constants/app_colors.dart';
import 'package:reto_atiksoluciones/core/constants/app_sizes.dart';
import 'package:reto_atiksoluciones/core/constants/app_text_styles.dart';

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
    final Color backgroundColor = isActive
        ? AppColors.background.withOpacity(0.1)
        : isHovered
        ? AppColors.background.withOpacity(0.033)
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
        child: Container(
          height: 44,
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(AppSizes.sm),
            border: border,
          ),
          child: Row(
            children: [
              Icon(icon, color: AppColors.background, size: 20),
              if (!isCollapsed) ...[
                const SizedBox(width: AppSizes.sm),
                Expanded(
                  child: Text(
                    title,
                    style: AppTextStyles.sidebarSection,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (showToggleIcon)
                  Icon(
                    isExpanded ? Icons.expand_less : Icons.expand_more,
                    size: 16,
                    color: AppColors.background,
                  ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}