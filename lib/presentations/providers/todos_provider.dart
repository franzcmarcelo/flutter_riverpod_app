import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../config/config.dart';
import '../../domain/domains.dart';

const _uuid = Uuid();

enum TodoFilter {
  all,
  completed,
  pending,
}

final todoFilterProvider = StateProvider<TodoFilter>((ref) {
  return TodoFilter.all;
});

final todosProvider = StateNotifierProvider<TodosNotifier, List<Todo>>((ref) {
  return TodosNotifier();
});

final filteredTodosProvider = Provider<List<Todo>>((ref) {
  final selectedFilter = ref.watch(todoFilterProvider);
  final todos = ref.watch(todosProvider);
  return todos.where((todo) {
    if(selectedFilter == TodoFilter.all) return true;
    if(selectedFilter == TodoFilter.completed) return todo.done;
    if(selectedFilter == TodoFilter.pending) return !todo.done;
    return false;
  }).toList();
});

class TodosNotifier extends StateNotifier<List<Todo>> {

  TodosNotifier() : super([
    Todo(
      id: _uuid.v4(),
      description: RandomGenerator.getRandomName(),
      completedAt: null,
    ),
  ]);

  void add() {
    state = [
      ...state,
      Todo(
        id: _uuid.v4(),
        description: RandomGenerator.getRandomName(),
        completedAt: null,
      )
    ];
  }

  void toggle( String id ) {
    state = state.map((todo) {
      if(todo.id != id) return todo;
      if(todo.done) return todo.copyWith(completedAt: null);
      return todo.copyWith(completedAt: DateTime.now());
    }).toList();
  }
}