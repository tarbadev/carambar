import 'character.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final characterProvider = StateNotifierProvider((_) => _CharacterNotifier());

class _CharacterNotifier extends StateNotifier<Character> {
  _CharacterNotifier(): super(Character(firstName: 'Jane', lastName: 'Doe', age: 18));

  void age() {
    state = state.incrementAge();
  }
}