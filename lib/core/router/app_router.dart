import 'package:go_router/go_router.dart';
import 'package:reto_atiksoluciones/features/requests/presentation/pages/requests_page.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/solicitudes',
    routes: [
      GoRoute(
        path: '/solicitudes',
        builder: (context, state) => const RequestsPage(),
      ),
    ],
  );
}