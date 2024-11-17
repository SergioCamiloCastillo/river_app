import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repaso_riverpod/config/helpers/random_generate_helper.dart';

final namesStreamProvider = StreamProvider<String>((ref) async* {
  await for (final name in RandomGenerate.getRandomNameStream()) {
    yield name;
  }
});
/*final namesStreamProvider = StreamProvider<List<String>>((ref) async* {
  await Future.delayed(const Duration(seconds: 2));
  yield [];
  await Future.delayed(const Duration(seconds: 2));
  yield ['Sergio'];
  await Future.delayed(const Duration(seconds: 2));
  yield ['Alice', 'Bob', 'Charlie'];
  await Future.delayed(const Duration(seconds: 2));
  yield ['David', 'Eve', 'Frank'];
});
*/