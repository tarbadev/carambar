import 'package:carambar/character_provider.dart';
import 'package:carambar/domain/character.dart';
import 'package:carambar/domain/work/job.dart';

import 'mock_definitions.dart';

class FakeCharacterNotifier extends CharacterNotifier {
  FakeCharacterNotifier({Character character}) : super(Mocks.mockProviderReference) {
    state = character;
  }

  @override
  void setJob(Job job) => Mocks.mockCharacterNotifier.setJob(job);
}
