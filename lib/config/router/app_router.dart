import 'package:go_router/go_router.dart';
import '../../presentations/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.routeName,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/state-provider',
      name: StateProviderScreen.routeName,
      builder: (context, state) => const StateProviderScreen(),
    ),
  ],
);