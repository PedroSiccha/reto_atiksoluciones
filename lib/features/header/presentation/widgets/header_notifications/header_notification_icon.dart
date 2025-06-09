import 'package:flutter/material.dart';
import 'package:reto_atiksoluciones/features/header/data/models/notification_item.dart';
import 'package:reto_atiksoluciones/features/header/presentation/widgets/header_notifications/header_notification_overlay.dart';

class HeaderNotificationIcon extends StatefulWidget {
  const HeaderNotificationIcon({super.key});

  @override
  State<HeaderNotificationIcon> createState() => _HeaderNotificationIconState();
}

class _HeaderNotificationIconState extends State<HeaderNotificationIcon> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;

  final List<NotificationItem> mockNotifications = const [
    NotificationItem(
      title: 'Nueva postulación',
      message: 'Miguel Rodríguez ha aplicado para Chef Ejecutivo',
      time: 'Hace 5 min',
    ),
    NotificationItem(
      title: 'Entrevista programada',
      message: 'Entrevista con Laura Sánchez a las 10:00 AM',
      time: 'Hace 2 horas',
    ),
    NotificationItem(
      title: 'Prueba completada',
      message: 'Carlos Jiménez completó la prueba psicométrica',
      time: 'Ayer',
    ),
  ];

  void _toggleMenu() {
    if (_overlayEntry == null) {
      _showOverlay();
    } else {
      _removeOverlay();
    }
  }

  void _showOverlay() {
    final overlay = Overlay.of(context);

    _overlayEntry = OverlayEntry(
      builder: (context) => GestureDetector(
        onTap: _removeOverlay,
        behavior: HitTestBehavior.translucent,
        child: Stack(
          children: [
            Positioned(
              top: 70,
              right: 24,
              child: CompositedTransformFollower(
                link: _layerLink,
                offset: const Offset(-220, 10),
                showWhenUnlinked: false,
                child: HeaderNotificationOverlay(
                  onClose: _removeOverlay,
                  notifications: mockNotifications,
                ),
              ),
            ),
          ],
        ),
      ),
    );

    overlay.insert(_overlayEntry!);
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: _toggleMenu,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.notifications_none, size: 20),
            ),
          ),
          Positioned(
            top: 2,
            right: 2,
            child: Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}