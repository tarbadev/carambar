import 'package:carambar/character_life_provider.dart';
import 'package:carambar/domain/age_event.dart';
import 'package:carambar/domain/life_event.dart';
import 'package:carambar/domain/work.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'domain/character.dart';

final characterProvider = StateNotifierProvider((ref) => CharacterNotifier(ref));

class CharacterNotifier extends StateNotifier<Character> {
  final ProviderReference ref;

  CharacterNotifier(this.ref) : super(null);

  void age() {
    state = state.incrementAge();

    List<LifeEvent> lifeEvents = [];
    if (state.age == 25 && state.currentHousing == Housing.Homeless) {
      lifeEvents.add(KickedOutFromParents());
    }

    this.ref.read(characterLifeProvider).addAgeEvent(state.age, lifeEvents: lifeEvents);
  }

  void setJob(CareerJob careerJob) {
    state = state.setCurrentJob(careerJob);
    this.ref.read(characterLifeProvider).addAgeEvent(state.age, lifeEvents: [NewJob(careerJob)]);
  }

  void setCharacterFromAgeEvents(List<AgeEvent> ageEvents) {
    final lifeEvents = ageEvents.map((e) => e.lifeEvents).expand((e) => e).toList();
    lifeEvents.forEach((lifeEvent) {
      switch (lifeEvent.runtimeType) {
        case InitiateEvent:
          state = Character.fromInitiateEvent(lifeEvent);
          break;
        default:
          throw LifeEventTypeNotKnownException(lifeEvent.runtimeType);
      }
    });
  }
}

class LifeEventTypeNotKnownException implements Exception {
  final unknownType;

  LifeEventTypeNotKnownException(this.unknownType);

  String toString() {
    if (unknownType == null) return "LifeEventTypeNotKnownException";
    return "LifeEventTypeNotKnownException: Unknown type ($unknownType)";
  }
}