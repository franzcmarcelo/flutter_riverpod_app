import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../providers/providers.dart';

class StreamProviderScreen extends ConsumerWidget {
  static const String routeName = 'stream_provider_screen';

  const StreamProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final randomNames$ = ref.watch(namesStreamProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Provider'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            'List of Contacts',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
          const SizedBox(height: 30),
          randomNames$.when(
            data: (names) => Expanded(
              child: Center(
                child: ListView.builder(
                  itemCount: names.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        names[index],
                        style: GoogleFonts.russoOne(),
                      ),
                      dense: true,
                      leading: CircleAvatar(
                        child: Text(
                          names[index][0],
                          style: GoogleFonts.russoOne(),
                        ),
                      ),
                      trailing: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.chat_bubble_outline_rounded),
                          SizedBox(width: 10),
                          Icon(Icons.call_rounded),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            error: (error, stackTrace) => Center(
              child: Text('Error: $error'),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}
