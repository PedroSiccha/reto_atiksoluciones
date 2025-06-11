import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final Widget sidebar;
  final Widget header;
  final Widget content;

  const AppScaffold({
    super.key,
    required this.sidebar,
    required this.header,
    required this.content,
  });

  static const double _breakpointDesktop = 1024;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isDesktop = constraints.maxWidth >= _breakpointDesktop;

          return Row(
            children: [
              if (isDesktop) sidebar,
              Expanded(
                child: Column(
                  children: [
                    header,
                    Expanded(child: content),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}