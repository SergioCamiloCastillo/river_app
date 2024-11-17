import 'package:random_name_generator/random_name_generator.dart';

class RandomGenerate {
  static String getRandomName() {
    final randomName = RandomNames(Zone.spain);
    return randomName.fullName();
  }

  static Stream<String> getRandomNameStream() {
    return Stream.periodic(const Duration(seconds: 2), (x) {
      return getRandomName();
    });
  }
}
