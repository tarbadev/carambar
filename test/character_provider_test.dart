import 'package:carambar/character.dart';
import 'package:carambar/character_provider.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CharacterNotifier', () {
    test('Age should be incremented', () {
      var characterNotifier = CharacterNotifier();
      expect(characterNotifier.state.age, 18);

      characterNotifier.age();

      expect(characterNotifier.state.age, 19);
    });

    test('Reset should be set the initial character', () {
      var character = Character(firstName: 'John', lastName: 'McLane', age: 25);
      var characterNotifier = CharacterNotifier();
      characterNotifier.state = character;

      expect(characterNotifier.state, character);

      characterNotifier.reset();

      expect(characterNotifier.state,
          Character(firstName: 'Jane', lastName: 'Doe', age: 18));
    });
  });
}
