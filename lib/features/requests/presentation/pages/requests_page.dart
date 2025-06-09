import 'package:flutter/material.dart';
import 'package:reto_atiksoluciones/core/layout/app_scaffold.dart';
import 'package:reto_atiksoluciones/features/sidebar/presentation/widgets/sidebar_widget.dart';
import 'package:reto_atiksoluciones/features/header/presentation/widgets/header_widget.dart';
import 'package:reto_atiksoluciones/features/solicitudes/presentation/widgets/main_content.dart';

class RequestsPage extends StatelessWidget {
  const RequestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: const AppScaffold(
        sidebar: SidebarWidget(),
        header: HeaderWidget(breadcrumbItems: ['Portal de Empleo', 'Solicitudes']),
        content: MainContent(),
      ),
    );
  }
}