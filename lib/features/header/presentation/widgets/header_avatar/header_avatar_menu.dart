import 'package:flutter/material.dart';
import 'package:reto_atiksoluciones/core/models/menu_option.dart';
import 'package:reto_atiksoluciones/features/header/presentation/widgets/header_avatar/header_avatar_menu_overlay.dart';

class HeaderAvatarMenu extends StatefulWidget {
  const HeaderAvatarMenu({super.key});

  @override
  State<HeaderAvatarMenu> createState() => _HeaderAvatarMenuState();
}

class _HeaderAvatarMenuState extends State<HeaderAvatarMenu> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;

  void _toggleMenu() {
    if (_overlayEntry == null) {
      _showOverlay();
    } else {
      _removeOverlay();
    }
  }

  void _showOverlay() {
    final overlay = Overlay.of(context);
    final List<MenuOption> menuOptions = [
      const MenuOption(Icons.person_outline, 'Perfil'),
      const MenuOption(Icons.settings_outlined, 'Configuración'),
      const MenuOption(Icons.help_outline, 'Ayuda'),
      const MenuOption.divider(),
      const MenuOption(Icons.logout, 'Cerrar sesión', isDestructive: true),
    ];

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
                offset: const Offset(-180, 10),
                showWhenUnlinked: false,
                child: HeaderAvatarMenuOverlay(
                  onClose: _removeOverlay,
                  menuOptions: menuOptions,
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
      child: InkWell(
        onTap: _toggleMenu,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(6),
          decoration: const BoxDecoration(
            color: Color(0xFF1E2A41),
            shape: BoxShape.circle,
          ),
          child: const Text(
            'JP',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}