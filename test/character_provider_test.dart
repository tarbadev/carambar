import 'package:carambar/character_life_provider.dart';
import 'package:carambar/character_provider.dart';
import 'package:carambar/domain/life_event.dart';
import 'package:carambar/domain/work/job.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'utils/mock_definitions.dart';
import 'utils/test_factory.dart';

void main() {
  group('CharacterNotifier', () {
    setUpAll(() {
      when(Mocks.mockProviderReference.read(characterLifeProvider))
          .thenReturn(Mocks.mockCharacterLifeNotifier);
    });

    test('Age should be incremented', () {
      var character = TestFactory.character(firstName: 'John', lastName: 'McLane', age: 25);
      var characterNotifier = CharacterNotifier(Mocks.mockProviderReference);
      characterNotifier.state = character; // ignore: invalid_use_of_protected_member

      characterNotifier.age();

      expect(characterNotifier.state.age, 26); // ignore: invalid_use_of_protected_member
    });

    test('SetJob should set the current job', () {
      var character = TestFactory.character(
        firstName: 'John',
        lastName: 'McLane',
        age: 25,
        currentJob: null,
      );
      var expectedCharacter = character.copy(currentJob: AllJobs.dishwasher);
      var characterNotifier = CharacterNotifier(Mocks.mockProviderReference);
      characterNotifier.state = character; // ignore: invalid_use_of_protected_member

      expect(characterNotifier.state, character); // ignore: invalid_use_of_protected_member

      characterNotifier.setJob(AllJobs.dishwasher);

      // ignore: invalid_use_of_protected_member
      expect(characterNotifier.state, expectedCharacter);
    });

    test('Should add an age event on age call', () {
      final character = TestFactory.character(age: 25);
      final characterNotifier = CharacterNotifier(Mocks.mockProviderReference);
      characterNotifier.state = character; // ignore: invalid_use_of_protected_member

      characterNotifier.age();

      verify(Mocks.mockCharacterLifeNotifier.addAgeEvent(26));
    });

    test('Should add an age event on age call when turning 25 and being kicked out by parents', () {
      final character = TestFactory.character(age: 24);
      final characterNotifier = CharacterNotifier(Mocks.mockProviderReference);
      characterNotifier.state = character; // ignore: invalid_use_of_protected_member

      characterNotifier.age();

      verify(Mocks.mockCharacterLifeNotifier.addAgeEvent(25, lifeEvents: [KickedOutFromParents()]));
    });

    test('Should add an age event on setJob', () {
      var character = TestFactory.character(currentJob: null);
      var characterNotifier = CharacterNotifier(Mocks.mockProviderReference);
      characterNotifier.state = character; // ignore: invalid_use_of_protected_member

      characterNotifier.setJob(AllJobs.dishwasher);

      verify(Mocks.mockCharacterLifeNotifier
          .addAgeEvent(character.age, lifeEvents: [NewJob(AllJobs.dishwasher)]));
    });
  });
}
