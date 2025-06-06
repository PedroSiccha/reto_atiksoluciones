import 'package:flutter/material.dart';

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
                child: Material(
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
                        _buildItem(Icons.person_outline, 'Perfil', () {
                          _removeOverlay();
                        }),
                        _buildItem(Icons.settings_outlined, 'Configuración', () {
                          _removeOverlay();
                        }),
                        _buildItem(Icons.help_outline, 'Ayuda', () {
                          _removeOverlay();
                        }),
                        const Divider(height: 1),
                        _buildItem(
                          Icons.logout,
                          'Cerrar sesión',
                              () {
                            _removeOverlay();
                          },
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ),
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

  Widget _buildItem(
      IconData icon,
      String label,
      VoidCallback onTap, {
        Color color = Colors.black87,
      }) {
    return InkWell(
      onTap: onTap,
      hoverColor: Colors.grey.shade100,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Icon(icon, size: 18, color: color),
            const SizedBox(width: 10),
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
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