import 'package:carambar/character.dart';
import 'package:carambar/character_provider.dart';

class FakeCharacterNotifier extends CharacterNotifier {
  FakeCharacterNotifier({Character character}) {
    state = character;
  }
}