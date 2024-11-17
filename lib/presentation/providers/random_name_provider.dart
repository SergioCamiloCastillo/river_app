import 'package:flutter_riverpod/flutter_riverpod.dart' show StateProvider;
import 'package:repaso_riverpod/config/helpers/random_generate_helper.dart';

final randomNameProvider = StateProvider.autoDispose<String>((ref) {
  return RandomGenerate.getRandomName();
});
