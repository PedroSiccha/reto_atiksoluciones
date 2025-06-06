import 'package:flutter/material.dart';
import 'package:reto_atiksoluciones/core/layout/widgets/header/components/header_avatar_menu.dart';
import 'package:reto_atiksoluciones/core/layout/widgets/header/components/header_notification_icon.dart';
import 'package:reto_atiksoluciones/core/layout/widgets/header/components/header_theme_toggle_button.dart';

class HeaderActions extends StatelessWidget {
  const HeaderActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        HeaderNotificationIcon(),
        SizedBox(width: 16),
        HeaderThemeToggleButton(),
        SizedBox(width: 16),
        HeaderAvatarMenu(),
      ],
    );
  }
}