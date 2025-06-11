import 'package:flutter/material.dart';
import 'package:reto_atiksoluciones/core/layout/widgets/app_header.dart';
import 'package:reto_atiksoluciones/core/shared/widgets/breadcrumb_widget.dart';
import 'package:reto_atiksoluciones/features/header/presentation/widgets/header_actions.dart';
import 'package:reto_atiksoluciones/features/header/presentation/widgets/header_avatar/header_avatar_menu.dart';
import 'package:reto_atiksoluciones/features/header/presentation/widgets/header_notifications/header_notification_icon.dart';
import 'package:reto_atiksoluciones/features/header/presentation/widgets/header_theme_toggle_button.dart';

class HeaderWidget extends StatelessWidget {
  final List<String> breadcrumbItems;

  const HeaderWidget({
    super.key,
    required this.breadcrumbItems,
  });

  @override
  Widget build(BuildContext context) {
    return AppHeader(
      left: BreadcrumbWidget(items: breadcrumbItems),
      right: const HeaderActions(
        actions: [
          HeaderNotificationIcon(),
          HeaderThemeToggleButton(),
          HeaderAvatarMenu(),
        ],
      ),
    );
  }
}