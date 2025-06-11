import 'package:flutter/material.dart';
import 'package:reto_atiksoluciones/core/constants/app_colors.dart';
import 'package:reto_atiksoluciones/core/constants/app_sizes.dart';
import 'package:reto_atiksoluciones/core/constants/ui_constants.dart' as AppTextStyles;

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
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.sm,
        vertical: AppSizes.sm,
      ),
      child: Row(
        children: [
          _buildLogo(),
          if (!isCollapsed) ...[
            const SizedBox(width: AppSizes.sm),
            Expanded(child: _buildTitle()),
          ],
          _buildToggleButton(),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppSizes.xs),
      ),
      alignment: Alignment.center,
      child: Text(
        "HT",
        style: AppTextStyles.logoText,
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      "Ho-Tech",
      style: AppTextStyles.sidebarTitle,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildToggleButton() {
    return IconButton(
      onPressed: onToggle,
      icon: Icon(
        isCollapsed ? Icons.chevron_right : Icons.chevron_left,
        color: AppColors.background,
        size: 20,
      ),
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(minWidth: 25, minHeight: 40),
      tooltip: isCollapsed ? "Expandir" : "Colapsar",
    );
  }
}