import 'package:flutter/material.dart';
import 'package:reto_atiksoluciones/core/constants/ui_constants.dart';

class HeaderAvatarMenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color color;

  const HeaderAvatarMenuItem({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.color = Colors.black87,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      hoverColor: Colors.grey.shade100,
      child: Padding(
        padding: kHeaderMenuItemPadding,
        child: Row(
          children: [
            Icon(icon, size: kHeaderMenuIconSize, color: color),
            const SizedBox(width: 10),
            Text(
              label,
              style: kHeaderMenuItemTextStyle.copyWith(color: color),
            ),
          ],
        ),
      ),
    );
  }
}