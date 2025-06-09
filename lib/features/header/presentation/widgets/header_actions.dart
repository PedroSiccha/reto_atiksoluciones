import 'package:flutter/material.dart';

class HeaderActions extends StatelessWidget {
  final List<Widget> actions;
  final double spacing;

  const HeaderActions({
    super.key,
    required this.actions,
    this.spacing = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(actions.length * 2 - 1, (index) {
        final isWidget = index.isEven;
        final i = index ~/ 2;

        if (isWidget) {
          return actions[i];
        } else {
          return SizedBox(width: spacing);
        }
      }),
    );
  }
}