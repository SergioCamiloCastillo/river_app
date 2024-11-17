import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repaso_riverpod/presentation/providers/provider.dart';

class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //widgetref tiene la referencia que definimos en providerscrope en el main y el cual tendra acceso a todos los providers que esten alli
    final randomName = ref.watch(randomNameProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('State provider screen'),
      ),
      body: Center(
        child: Text(randomName),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //se aconseja usar read dentro de metodos
          //el notifier, me notifica a los widgets y los otros providers que el valor cambia
          //ref.read(randomNameProvider.notifier).update((state)=> state.toUpperCase());
          ref.invalidate(randomNameProvider);
        },
        child: const Icon(Icons.refresh_rounded),
      ),
    );
  }
}
