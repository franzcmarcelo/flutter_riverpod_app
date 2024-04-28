import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../config/config.dart';

class ProviderScreen extends ConsumerWidget {

  static const String routeName = 'provider_screen';

  const ProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider'),
      ),
      body: Center(
        child: Text(
          'Current location: ${ref.read(appRouterProvider).namedLocation(ProviderScreen.routeName)}',
          style: TextStyle(
            fontFamily: GoogleFonts.russoOne().fontFamily,
            fontSize: 20,
          )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(appRouterProvider).pop();
        },
        child: const Icon(Icons.arrow_back_ios_new_outlined),
      )
    );
  }
}