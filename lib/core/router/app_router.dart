import 'package:go_router/go_router.dart';


/// Route path constants. Add one per screen so pages never hardcode a
/// path string when navigating.
abstract class AppRoutes {
  AppRoutes._();

  static const String counter = '/';
}

/// App-wide route table. Add a new feature's page here as its own
/// [GoRoute] (or nested under an existing one for sub-flows).
final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.counter,
  routes: [
    // GoRoute(
    //   path: AppRoutes.counter,
    //   builder: (context, state) => const CounterPage(),
    // ),
  ],
);
