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
        title: const Text('State Notifier Provider'),
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

    final currentFilter = ref.watch( todoFilterProvider );
    final filteredTodos = ref.watch( filteredTodosProvider );

    return Column(
      children: [
        const SizedBox(height: 20),
        const Text(
          'Guest List',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
          ),
        ),
        const SizedBox(height: 30),
        SegmentedButton(
          segments: const [
            ButtonSegment(value: TodoFilter.all, icon: Text('All')),
            ButtonSegment(value: TodoFilter.completed, icon: Text('Completed')),
            ButtonSegment(value: TodoFilter.pending, icon: Text('Pending')),
          ],
          selected: <TodoFilter>{currentFilter},
          onSelectionChanged: (value) {
            ref.read( todoFilterProvider.notifier ).update((state) => value.first);
          },
        ),
        const SizedBox(height: 10),
        Expanded(
          child: filteredTodos.isEmpty
            ? const Center(
                child: Text(
                  'No Guest Found',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : ListView.builder(
              itemCount: filteredTodos.length,
              itemBuilder: (context, index) {
                final todo = filteredTodos[index];
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
            ),
        ),
      ],
    );
  }
}