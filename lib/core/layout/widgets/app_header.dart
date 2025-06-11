import 'package:flutter/material.dart';
import 'package:reto_atiksoluciones/core/constants/ui_constants.dart';
import 'package:reto_atiksoluciones/core/constants/ui_typedefs.dart';

class AppHeader extends StatelessWidget {
  final HeaderSlotWidget left;
  final HeaderSlotWidget right;

  const AppHeader({
    super.key,
    required this.left,
    required this.right,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kHeaderHeight,
      width: double.infinity,
      padding: kHeaderHorizontalPadding,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: kDefaultBoxShadow
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [left, right],
      ),
    );
  }
}