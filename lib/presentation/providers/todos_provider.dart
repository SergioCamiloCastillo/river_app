import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repaso_riverpod/config/helpers/random_generate_helper.dart';
import 'package:repaso_riverpod/domain/entities/todo_entity.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

final todosProvider =
    StateNotifierProvider<TodosNotifier, List<TodoEntity>>((ref) {
  return TodosNotifier();
});

class TodosNotifier extends StateNotifier<List<TodoEntity>> {
  TodosNotifier()
      : super([
          TodoEntity(
              id: uuid.v4(),
              description: RandomGenerate.getRandomName(),
              completeAt: null),
          TodoEntity(
              id: uuid.v4(),
              description: RandomGenerate.getRandomName(),
              completeAt: null),
          TodoEntity(
              id: uuid.v4(),
              description: RandomGenerate.getRandomName(),
              completeAt: DateTime.now())
        ]);

  void addTodo() {
    state = [
      ...state,
      TodoEntity(
          id: uuid.v4(),
          description: RandomGenerate.getRandomName(),
          completeAt: null)
    ];
  }


  void toggleTodo(String id) {
    state = state.map<TodoEntity>((todo) {
      if (todo.id != id) return todo;
      if (todo.done) return todo.copyWith(completeAt: null);
      return todo.copyWith(completeAt: DateTime.now());
    }).toList();
  }
}
