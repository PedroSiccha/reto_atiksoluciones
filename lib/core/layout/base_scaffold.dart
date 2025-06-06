import 'package:flutter/material.dart';
import 'package:reto_atiksoluciones/core/layout/widgets/sidebar/sidebar_widget.dart';

class BaseScaffold extends StatelessWidget {
  final Widget child;

  const BaseScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Row(
            children: [
              const SidebarWidget(),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      height: 64,
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: const [
                          Expanded(child: Text('HEADER')),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: ConstrainedBox(
                            constraints: BoxConstraints(minHeight: constraints.maxHeight),
                            child: child,
                          ),
                        ),
                      ),
                    ),
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