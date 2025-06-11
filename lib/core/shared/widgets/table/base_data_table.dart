import 'dart:ui';

import 'package:flutter/material.dart';

class BaseDataTable extends StatelessWidget {
  final List<DataColumn> columns;
  final List<DataRow> rows;
  final double minColumnWidth;

  const BaseDataTable({
    super.key,
    required this.columns,
    required this.rows,
    this.minColumnWidth = 140,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double requiredWidth = columns.length * minColumnWidth;
        final double availableWidth = constraints.maxWidth;

        final double effectiveWidth = requiredWidth > availableWidth ? requiredWidth : availableWidth;

        final table = DataTable(
          columns: columns,
          rows: rows,
          headingRowHeight: 56,
          dataRowMinHeight: 56,
          dataRowMaxHeight: 64,
          columnSpacing: 24,
          horizontalMargin: 16,
          headingRowColor: MaterialStateProperty.all(
            const Color(0xFFF9FAFB),
          ),
          headingTextStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Color(0xFF374151),
          ),
          dataRowColor: MaterialStateProperty.resolveWith(
                (states) => states.contains(MaterialState.hovered)
                ? const Color(0xFFF9FAFB)
                : Colors.transparent,
          ),
        );

        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(
              dragDevices: {
                PointerDeviceKind.mouse,
                PointerDeviceKind.touch,
              },
            ),
            child: Scrollbar(
              thumbVisibility: true,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: effectiveWidth,
                  ),
                  child: IntrinsicWidth(
                    child: table,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}