import 'package:flutter/material.dart';
import 'package:reto_atiksoluciones/core/constants/ui_constants.dart';
import 'package:reto_atiksoluciones/core/constants/ui_typedefs.dart';
import 'package:reto_atiksoluciones/core/shared/widgets/breadcrumb_item_widget.dart';

class BreadcrumbWidget extends StatelessWidget {
  final List<BreadcrumbItemLabel> items;

  const BreadcrumbWidget({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(items.length * 2 - 1, (index) {
        final isItem = index.isEven;
        final i = index ~/ 2;

        if (isItem) {
          final isLast = i == items.length - 1;
          return BreadcrumbItemWidget(label: items[i], isLast: isLast);
        } else {
          return kBreadcrumbSeparator;
        }
      }),
    );
  }
}