import 'package:flutter/material.dart';
import 'package:reto_atiksoluciones/core/constants/ui_constants.dart';

class BreadcrumbItemWidget extends StatelessWidget {
  final String label;
  final bool isLast;

  const BreadcrumbItemWidget({
    super.key,
    required this.label,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: isLast? kBreadcrumbActiveStyle: kBreadcrumbStyle,
    );
  }
}