import 'character.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final characterProvider = StateNotifierProvider((_) => CharacterNotifier());

final _initialCharacter = Character(firstName: 'Jane', lastName: 'Doe', age: 18);

class CharacterNotifier extends StateNotifier<Character> {
  CharacterNotifier(): super(_initialCharacter);

  void age() {
    state = state.incrementAge();
  }

  void reset() {
    state = _initialCharacter;
  }
}