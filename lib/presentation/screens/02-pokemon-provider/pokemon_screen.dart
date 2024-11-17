import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repaso_riverpod/presentation/providers/provider.dart';

class PokemonScreen extends ConsumerWidget {
  const PokemonScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonId = ref.watch(pokemonIdProvider);
    final pokemonAsync = ref.watch(pokemonNameProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Pokemon numero $pokemonId'),
      ),
      body: Center(
        child: pokemonAsync.when(
          data: (data) => Text(data),
          error: (error, stackTrace) => Text('Error: $error'),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              heroTag: 'pokemonIdDecrement',
              child: const Icon(Icons.exposure_minus_1),
              onPressed: () {
                ref
                    .read(pokemonIdProvider.notifier)
                    .update((state) => state - 1);
              }),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
              heroTag: 'pokemonIdIncrement',
              child: const Icon(Icons.plus_one),
              onPressed: () {
                ref
                    .read(pokemonIdProvider.notifier)
                    .update((state) => state + 1);
              }),
        ],
      ),
    );
  }
}
