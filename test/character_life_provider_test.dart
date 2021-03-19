import 'package:carambar/character_life_provider.dart';
import 'package:carambar/character_provider.dart';
import 'package:carambar/domain/age_event.dart';
import 'package:carambar/domain/character_life.dart';
import 'package:carambar/domain/life_event.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'utils/mock_definitions.dart';

void main() {
  group('CharacterLifeNotifier', () {
    setUpAll(() {
      when(Mocks.mockProviderReference.read(characterProvider))
          .thenReturn(Mocks.mockCharacterNotifier);
    });

    test('Constructor should add an InitiateEvent and initiate the character', () {
      final ageEvent = AgeEvent(18, [InitiateEvent('Jane', 'Doe')]);

      final characterLifeNotifier = CharacterLifeNotifier(Mocks.mockProviderReference);
      // ignore: invalid_use_of_protected_member
      characterLifeNotifier.state = CharacterLife([ageEvent]);

      verify(Mocks.mockCharacterNotifier.setCharacterFromAgeEvents([ageEvent]));
    });

    test('Reset should reset the state, add an InitiateEvent and initiate the character', () {
      final ageEvent = AgeEvent(18, [InitiateEvent('Jane', 'Doe')]);
      final characterLifeNotifier = CharacterLifeNotifier(Mocks.mockProviderReference);
      // ignore: invalid_use_of_protected_member
      characterLifeNotifier.state = CharacterLife([ageEvent, ageEvent, ageEvent]);

      characterLifeNotifier.reset();

      // ignore: invalid_use_of_protected_member
      expect(characterLifeNotifier.state, CharacterLife([ageEvent]));

      verify(Mocks.mockCharacterNotifier.setCharacterFromAgeEvents([ageEvent]));
    });
  });
}
