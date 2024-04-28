import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_app/config/config.dart';
import 'package:flutter_riverpod_app/presentations/providers/providers.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MainApp()
    )
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final appRouter = ref.watch(appRouterProvider);
    final isDarkMode = ref.watch(isDarkModeProvider);

    return MaterialApp.router(
      routerConfig: appRouter,
      theme: AppTheme(isDarkMode: isDarkMode).getTheme(),
      debugShowCheckedModeBanner: false,
    );
  }
}
