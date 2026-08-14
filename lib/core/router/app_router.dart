import 'package:demapp/features/auth/presentation/bloc/login_bloc.dart';
import 'package:demapp/features/auth/presentation/pages/login_page.dart';
import 'package:demapp/features/cart/presentation/pages/cart_page.dart';
import 'package:demapp/features/products/presentation/pages/home_page.dart';
import 'package:demapp/features/splash/presentation/pages/splash_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../di/injection_container.dart';

/// Route path constants. Add one per screen so pages never hardcode a
/// path string when navigating.
abstract class AppRoutes {
  AppRoutes._();

  static const String splash = '/';
  static const String login = '/login';
  static const String home = '/home';
  static const String cart = '/cart';
}

/// App-wide route table. Add a new feature's page here as its own
/// [GoRoute] (or nested under an existing one for sub-flows).
final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.splash,
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: AppRoutes.login,
      builder: (context, state) {
        return BlocProvider(create: (_) => sl<LoginBloc>(), child: LoginPage());
      },
    ),

    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: AppRoutes.cart,
      builder: (context, state) => const CartPage(),
    ),
  ],
);
