import 'package:carambar/Work.dart';
import 'package:carambar/character_provider.dart';
import 'package:flutter_test/flutter_test.dart';

import 'test_factory.dart';

void main() {
  group('CharacterNotifier', () {
    test('Age should be incremented', () {
      var characterNotifier = CharacterNotifier();
      expect(characterNotifier.state.age, 18); // ignore: invalid_use_of_protected_member

      characterNotifier.age();

      expect(characterNotifier.state.age, 19); // ignore: invalid_use_of_protected_member
    });

    test('Reset should reset the initial character', () {
      var character = TestFactory.character(firstName: 'John', lastName: 'McLane', age: 25);
      var characterNotifier = CharacterNotifier();
      characterNotifier.state = character; // ignore: invalid_use_of_protected_member

      expect(characterNotifier.state, character); // ignore: invalid_use_of_protected_member

      characterNotifier.reset();

      // ignore: invalid_use_of_protected_member
      expect(characterNotifier.state,
          TestFactory.character(firstName: 'Jane', lastName: 'Doe', age: 18));
    });

    test('SetJob should set the current job', () {
      var character = TestFactory.character(
        firstName: 'John',
        lastName: 'McLane',
        age: 25,
        currentJob: null,
      );
      var expectedCharacter = character.copy(currentJob: CareerJob.Dishwasher);
      var characterNotifier = CharacterNotifier();
      characterNotifier.state = character; // ignore: invalid_use_of_protected_member

      expect(characterNotifier.state, character); // ignore: invalid_use_of_protected_member

      characterNotifier.setJob(CareerJob.Dishwasher);

      // ignore: invalid_use_of_protected_member
      expect(characterNotifier.state, expectedCharacter);
    });
  });
}
