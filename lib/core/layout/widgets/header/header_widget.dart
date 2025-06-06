import 'package:flutter/material.dart';
import 'package:reto_atiksoluciones/core/layout/widgets/header/components/header_actions.dart';
import 'package:reto_atiksoluciones/core/layout/widgets/header/components/header_breadcrumb.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          HeaderBreadcrumb(),
          HeaderActions(),
        ],
      ),
    );
  }
}