import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../providers/providers.dart';

class StateProviderScreen extends ConsumerWidget {

  static const String routeName = 'state_provider_screen';

  const StateProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final name = ref.watch(randomNameProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('State Provider'),
      ),
      body: Center(
        child: Text(
          name,
          style: TextStyle(
            fontFamily: GoogleFonts.russoOne().fontFamily,
            fontSize: 20,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Invalidates the state of the provider, causing it to refresh, re-generate a new value.
          ref.invalidate(randomNameProvider);
        },
        child: const Icon(Icons.refresh_rounded),
      )
    );
  }
}