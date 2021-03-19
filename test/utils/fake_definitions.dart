import 'package:carambar/domain/character.dart';
import 'package:carambar/character_provider.dart';

import 'mock_definitions.dart';

class FakeCharacterNotifier extends CharacterNotifier {
  FakeCharacterNotifier({Character character}): super(Mocks.mockProviderReference) {
    state = character;
  }
}