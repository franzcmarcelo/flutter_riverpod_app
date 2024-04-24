import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/providers.dart';

class FutureProviderScreen extends ConsumerWidget {

  static const String routeName = 'future_provider_screen';

  const FutureProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final pokemonId = ref.watch(pokemonIdProvider);
    final pokemonNameAsync = ref.watch(pokemonNameProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Provider'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Pokemon ID: $pokemonId',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: pokemonNameAsync.when(
              data: (pokemonName) => Text('Pokemon name: $pokemonName'),
              loading: () => const CircularProgressIndicator(),
              error: (error, stackTrace) => Text('Error: $error'),
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: '1',
            child: const Icon(Icons.exposure_plus_1_outlined),
            onPressed: () => {
              ref.read(pokemonIdProvider.notifier)
                .update((state) => state + 1),
            },
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            heroTag: '2',
            child: const Icon(Icons.exposure_minus_1_outlined),
            onPressed: () => {
              ref.read(pokemonIdProvider.notifier)
                .update((state) => state - 1),
            },
          ),
        ],
      )
    );
  }
}