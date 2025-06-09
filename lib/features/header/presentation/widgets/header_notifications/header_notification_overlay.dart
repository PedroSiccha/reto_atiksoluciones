import 'package:flutter/material.dart';
import 'package:reto_atiksoluciones/features/header/data/models/notification_item.dart';
import 'package:reto_atiksoluciones/features/header/presentation/widgets/header_notifications/header_notification_item.dart';

class HeaderNotificationOverlay extends StatelessWidget {
  final VoidCallback onClose;
  final List<NotificationItem> notifications;

  const HeaderNotificationOverlay({
    super.key,
    required this.onClose,
    required this.notifications,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 280,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 12, 16, 8),
              child: Text(
                'Notificaciones',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            const Divider(height: 1),
            ...notifications.map(
                  (item) => HeaderNotificationItem(
                title: item.title,
                message: item.message,
                time: item.time,
              ),
            ),
            const Divider(height: 1),
            Center(
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Ver todas',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}