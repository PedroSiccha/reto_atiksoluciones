import 'package:flutter/material.dart';
import 'package:reto_atiksoluciones/features/header/data/models/menu_option.dart';
import 'package:reto_atiksoluciones/features/header/presentation/widgets/header_avatar/header_avatar_menu_item.dart';

class HeaderAvatarMenuOverlay extends StatelessWidget {
  final VoidCallback onClose;
  final List<MenuOption> menuOptions;

  const HeaderAvatarMenuOverlay({
    super.key,
    required this.onClose,
    required this.menuOptions,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 12, 16, 4),
              child: Text(
                'Mi cuenta',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: Colors.black87,
                ),
              ),
            ),
            const Divider(height: 1),
            ...menuOptions.map((item) {
              if (item.isDivider) return const Divider(height: 1);
              return HeaderAvatarMenuItem(
                icon: item.icon!,
                label: item.label!,
                onTap: onClose,
                color: item.isDestructive ? Colors.red : Colors.black87,
              );
            }),
          ],
        ),
      ),
    );
  }
}