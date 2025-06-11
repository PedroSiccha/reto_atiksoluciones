import 'package:go_router/go_router.dart';
import 'package:reto_atiksoluciones/features/solicitudes/presentation/pages/solicitudes_page.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/solicitudes',
    routes: [
      GoRoute(
        path: '/solicitudes',
        builder: (context, state) => const SolicitudesPage(),
      ),
    ],
  );
}