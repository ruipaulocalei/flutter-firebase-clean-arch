import 'package:go_router/go_router.dart';
import 'package:hello_flutter_mac_app/features/jobs/screens/job_screen.dart';

enum AppRouter { home }

final router = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    name: AppRouter.home.name,
    builder: (context, state) => const JobScreen(),
  )
]);
