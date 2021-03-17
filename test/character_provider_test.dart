import 'package:carambar/character.dart';
import 'package:carambar/character_provider.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CharacterNotifier', () {
    test('Age should be incremented', () {
      var characterNotifier = CharacterNotifier();
      expect(characterNotifier.state.age, 18); // ignore: invalid_use_of_protected_member

      characterNotifier.age();

      expect(characterNotifier.state.age, 19); // ignore: invalid_use_of_protected_member
    });

    test('Reset should be set the initial character', () {
      var character = Character(firstName: 'John', lastName: 'McLane', age: 25);
      var characterNotifier = CharacterNotifier();
      characterNotifier.state = character; // ignore: invalid_use_of_protected_member

      expect(characterNotifier.state, character); // ignore: invalid_use_of_protected_member

      characterNotifier.reset();

      // ignore: invalid_use_of_protected_member
      expect(characterNotifier.state,
          Character(firstName: 'Jane', lastName: 'Doe', age: 18));
    });
  });
}
