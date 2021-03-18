import 'package:carambar/character_provider.dart';
import 'package:carambar/home_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:test_helpers/home_tab_tester.dart';

import 'mock_definitions.dart';

void main() {
  group('HomeTab', () {
    testWidgets('Calls character age method', (WidgetTester tester) async {
      await tester.pumpWidget(ProviderScope(
        overrides: [
          characterProvider.overrideWithValue(Mocks.mockCharacterNotifier)
        ],
        child: MaterialApp(home: HomeTab()),
      ));

      await HomeTabTester(tester).tapOnPlus1Year();

      verify(Mocks.mockCharacterNotifier.age());
    });
  });
}
