import 'package:carambar/domain/work.dart';
import 'package:carambar/domain/character.dart';
import 'package:carambar/character_provider.dart';
import 'package:carambar/character_tab.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_helpers/character_tab_tester.dart';

import 'utils/fake_definitions.dart';
import 'utils/test_factory.dart';
import 'utils/testable_widget.dart';

void main() {
  group('CharacterTab', () {
    testWidgets('Displays Unemployed if there is no current job', (WidgetTester tester) async {
      final character = TestFactory.character(currentJob: null);

      await tester.pumpWidget(buildTestableWidget(
        CharacterTab(),
        providerOverrides: [characterProvider.overrideWithValue(FakeCharacterNotifier(character: character))],
      ));

      var characterTabTester = CharacterTabTester(tester);
      expect(characterTabTester.currentCareer, 'Unemployed');
    });

    testWidgets('Displays the current job', (WidgetTester tester) async {
      final character = TestFactory.character(currentJob: CareerJob.Dishwasher);

      await tester.pumpWidget(buildTestableWidget(
        CharacterTab(),
        providerOverrides: [characterProvider.overrideWithValue(FakeCharacterNotifier(character: character))],
      ));

      var characterTabTester = CharacterTabTester(tester);
      expect(characterTabTester.currentCareer, 'Dishwasher');
    });

    testWidgets('Displays the current housing', (WidgetTester tester) async {
      final character = TestFactory.character(currentHousing: Housing.LivingWithParents);

      await tester.pumpWidget(buildTestableWidget(
        CharacterTab(),
        providerOverrides: [characterProvider.overrideWithValue(FakeCharacterNotifier(character: character))],
      ));

      var characterTabTester = CharacterTabTester(tester);
      expect(characterTabTester.currentHousing, 'Living with parents');
    });
  });
}