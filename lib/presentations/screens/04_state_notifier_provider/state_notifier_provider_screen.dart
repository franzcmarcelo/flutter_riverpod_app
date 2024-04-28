import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../providers/providers.dart';

class StateNotifierProviderScreen extends ConsumerWidget {

  static const String routeName = 'state_notifier_provider_screen';

  const StateNotifierProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Guest List'),
      ),
      body: const _TodosView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon( Icons.add ),
        onPressed: () {
          ref.read( todosProvider.notifier ).add();
        },
      ),
    );
  }
}

class _TodosView extends ConsumerWidget {
  const _TodosView();

  @override
  Widget build(BuildContext context, WidgetRef ref ) {

    final todos = ref.watch( todosProvider );

    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        return SwitchListTile(
          title: Text(
            todo.description,
            style: TextStyle(
              fontFamily: GoogleFonts.russoOne().fontFamily,
            )
          ),
          subtitle: Text(
            todo.done
              ? 'Completed at ${todo.completedAt.toString()}'
              : 'Pending',
          ),
          value: todo.done,
          onChanged: (_) {
            ref.read( todosProvider.notifier ).toggle( todo.id );
          }
        );
      },
    );
  }
}