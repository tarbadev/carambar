import 'package:carambar/character_provider.dart';
import 'package:carambar/domain/character_life.dart';
import 'package:carambar/domain/life_event.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'domain/age_event.dart';

final characterLifeProvider = StateNotifierProvider((ref) => CharacterLifeNotifier(ref));

class CharacterLifeNotifier extends StateNotifier<CharacterLife> {
  final ProviderReference ref;

  CharacterLifeNotifier(this.ref) : super(CharacterLife([])) {
    _initiateCharacterLife();
  }

  void _initiateCharacterLife() {
    final ageEvent = _generateAgeEvent(18, [InitiateEvent('Jane', 'Doe')]);
    this.ref.read(characterProvider).setCharacterFromAgeEvents([ageEvent]);
    state = state.addAgeEvent(ageEvent);
  }

  void addAgeEvent(int age, {List<LifeEvent> lifeEvents = const []}) {
    state = state.addAgeEvent(_generateAgeEvent(age, lifeEvents));
  }

  AgeEvent _generateAgeEvent(int age, List<LifeEvent> lifeEvents) => AgeEvent(age, lifeEvents);

  void reset() {
    state = CharacterLife([]);
    _initiateCharacterLife();
  }
}
