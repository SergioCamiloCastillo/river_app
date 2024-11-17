import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repaso_riverpod/presentation/providers/todos_provider.dart';

class StateNotifierProviderScreen extends ConsumerWidget {
  const StateNotifierProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de invitados'),
      ),
      body: const _TodosView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          ref.read(todosProvider.notifier).addTodo();
        },
      ),
    );
  }
}

class _TodosView extends ConsumerWidget {
  const _TodosView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todosProvider);
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return SwitchListTile(
            title: Text(todos[index].description),
            subtitle: Text(todos[index].completeAt.toString()),
            value: todos[index].done, // True o False
            onChanged: (value) {
              ref.read(todosProvider.notifier).toggleTodo(todos[index].id);
            });
      },
    );
  }
}
