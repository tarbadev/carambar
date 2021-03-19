import 'package:carambar/Work.dart';
import 'package:carambar/character.dart';
import 'package:carambar/character_provider.dart';
import 'package:carambar/character_tab.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_helpers/character_tab_tester.dart';

import 'fake_definitions.dart';
import 'testable_widget.dart';

void main() {
  group('CharacterTab', () {
    testWidgets('Displays Unemployed if there is no current job', (WidgetTester tester) async {
      final character = Character(currentJob: null);

      await tester.pumpWidget(buildTestableWidget(
        CharacterTab(),
        providerOverrides: [characterProvider.overrideWithValue(FakeCharacterNotifier(character: character))],
      ));

      var characterTabTester = CharacterTabTester(tester);
      expect(characterTabTester.currentCareer, 'Unemployed');
    });

    testWidgets('Displays the current job', (WidgetTester tester) async {
      final character = Character(currentJob: CareerJob.Dishwasher);

      await tester.pumpWidget(buildTestableWidget(
        CharacterTab(),
        providerOverrides: [characterProvider.overrideWithValue(FakeCharacterNotifier(character: character))],
      ));

      var characterTabTester = CharacterTabTester(tester);
      expect(characterTabTester.currentCareer, 'Dishwasher');
    });
  });
}
