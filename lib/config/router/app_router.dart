import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../presentations/screens/screens.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: HomeScreen.routeName,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/provider',
        name: ProviderScreen.routeName,
        builder: (context, state) => const ProviderScreen(),
      ),
      GoRoute(
        path: '/state-provider',
        name: StateProviderScreen.routeName,
        builder: (context, state) => const StateProviderScreen(),
      ),
      GoRoute(
        path: '/future-provider',
        name: FutureProviderScreen.routeName,
        builder: (context, state) => const FutureProviderScreen(),
      ),
      GoRoute(
        path: '/stream-provider',
        name: StreamProviderScreen.routeName,
        builder: (context, state) => const StreamProviderScreen(),
      ),
      GoRoute(
        path: '/state-notifier-provider',
        name: StateNotifierProviderScreen.routeName,
        builder: (context, state) => const StateNotifierProviderScreen(),
      ),
    ],
  );
});