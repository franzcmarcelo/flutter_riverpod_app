import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod_app/presentations/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);