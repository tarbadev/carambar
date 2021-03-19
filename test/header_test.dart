import 'package:carambar/character_provider.dart';
import 'package:carambar/header.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_helpers/header_tester.dart';

import 'utils/fake_definitions.dart';
import 'utils/test_factory.dart';
import 'utils/testable_widget.dart';

void main() {
  group('Header', () {
    testWidgets('Displays the character name and age', (WidgetTester tester) async {
      final character = TestFactory.character(firstName: 'Jane', lastName: 'Doe', age: 25);
      await tester.pumpWidget(buildTestableWidget(
        Header(),
        providerOverrides: [
          characterProvider.overrideWithValue(FakeCharacterNotifier(character: character))
        ],
      ));

      final headerHelper = HeaderTester(tester);

      expect(headerHelper.title, 'Jane Doe, 25');
    });
  });
}
