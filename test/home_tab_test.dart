import 'package:carambar/character_provider.dart';
import 'package:carambar/home_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'helper/base_view_tester.dart';

class _MockCharacterNotifier extends Mock implements CharacterNotifier {}

class _HomeTabHelper extends BaseViewTester {
  _HomeTabHelper(tester): super(tester);

  Future<void> tapOnPlus1Year() async {
    await tapOnButtonByKey('Home__Plus1YearButton');
  }
}

void main() {
  group('HomeTab', () {
    testWidgets('Calls character age method', (WidgetTester tester) async {
      var mockCharacterNotifier = _MockCharacterNotifier();
      await tester.pumpWidget(ProviderScope(
        overrides: [
          characterProvider.overrideWithValue(mockCharacterNotifier)
        ],
        child: MaterialApp(home: HomeTab()),
      ));

      await _HomeTabHelper(tester).tapOnPlus1Year();

      verify(mockCharacterNotifier.age());
    });
  });
}
