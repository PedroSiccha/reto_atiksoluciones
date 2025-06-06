import 'package:flutter/material.dart';

class HeaderBreadcrumb extends StatelessWidget {
  const HeaderBreadcrumb({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Inicio',
          style: TextStyle(
            color: Colors.blue.shade600,
            fontSize: 14,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Icon(Icons.chevron_right, size: 16, color: Colors.grey),
        ),
        const Text(
          'Solicitudes',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}