import 'package:carambar/character_provider.dart';
import 'package:carambar/home_tab.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:test_helpers/home_tab_tester.dart';

import 'mock_definitions.dart';
import 'testable_widget.dart';

void main() {
  group('HomeTab', () {
    testWidgets('Calls character age method', (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(
        HomeTab(),
        providerOverrides: [characterProvider.overrideWithValue(Mocks.mockCharacterNotifier)],
      ));

      await HomeTabTester(tester).tapOnPlus1Year();

      verify(Mocks.mockCharacterNotifier.age());
    });
  });
}
