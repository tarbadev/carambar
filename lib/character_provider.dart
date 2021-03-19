import 'package:carambar/Work.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'character.dart';

final characterProvider = StateNotifierProvider((_) => CharacterNotifier());

final _initialCharacter = Character(
  'Jane',
  'Doe',
  18,
  null,
  Housing.LivingWithParents,
);

class CharacterNotifier extends StateNotifier<Character> {
  CharacterNotifier() : super(_initialCharacter);

  void age() {
    state = state.incrementAge();
  }

  void reset() {
    state = _initialCharacter;
  }

  void setJob(CareerJob careerJob) {
    state = state.setCurrentJob(careerJob);
  }
}
