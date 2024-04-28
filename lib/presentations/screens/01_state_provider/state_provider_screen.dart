import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../providers/providers.dart';

class StateProviderScreen extends ConsumerStatefulWidget {

  static const String routeName = 'state_provider_screen';

  const StateProviderScreen({super.key});

  @override
  StateProviderScreenState createState() => StateProviderScreenState();
}

class StateProviderScreenState extends ConsumerState<StateProviderScreen> {

  @override
  Widget build(BuildContext context) {

    final name = ref.watch(randomNameProvider);
    final isDarkMode = ref.watch(isDarkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('State Provider'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: isDarkMode
                ? const Icon(Icons.light_mode_rounded)
                : const Icon(Icons.dark_mode_rounded),
              iconSize: 50,
              onPressed: () {
                ref.read(isDarkModeProvider.notifier).update((state) => !state);
              },
            ),
            const SizedBox(height: 20),
            Text(
              name,
              style: TextStyle(
                fontFamily: GoogleFonts.russoOne().fontFamily,
                fontSize: 20,
              ),
            ),
          ],
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

// class StateProviderScreen extends ConsumerWidget {

//   static const String routeName = 'state_provider_screen';

//   const StateProviderScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {

//     final name = ref.watch(randomNameProvider);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('State Provider'),
//       ),
//       body: Center(
//         child: Text(
//           name,
//           style: TextStyle(
//             fontFamily: GoogleFonts.russoOne().fontFamily,
//             fontSize: 20,
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Invalidates the state of the provider, causing it to refresh, re-generate a new value.
//           ref.invalidate(randomNameProvider);
//         },
//         child: const Icon(Icons.refresh_rounded),
//       )
//     );
//   }
// }