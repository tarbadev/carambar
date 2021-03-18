import 'package:carambar/bottom_navigation_item_provider.dart';
import 'package:carambar/character_provider.dart';
import 'package:carambar/settings_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'helper/settings_tab_tester.dart';

class _MockCharacterNotifier extends Mock implements CharacterNotifier {}
class _MockBottomNavigationItemNotifier extends Mock implements BottomNavigationItemNotifier {}

void main() {
  group('SettingsTab', () {
    testWidgets('Calls character reset method', (WidgetTester tester) async {
      var mockCharacterNotifier = _MockCharacterNotifier();
      var mockBottomNavigationItemNotifier = _MockBottomNavigationItemNotifier();
      await tester.pumpWidget(ProviderScope(
        overrides: [
          characterProvider.overrideWithValue(mockCharacterNotifier),
          bottomNavigationItemProvider.overrideWithValue(mockBottomNavigationItemNotifier)
        ],
        child: MaterialApp(home: SettingsTab()),
      ));

      final settingsTabHelper = SettingsTabTester(tester);
      await settingsTabHelper.tapOnEndLife();

      expect(settingsTabHelper.endLifeDialog.isVisible, true);

      await settingsTabHelper.endLifeDialog.confirmEndLife();

      expect(settingsTabHelper.endLifeDialog.isVisible, false);
      verify(mockCharacterNotifier.reset());
      verify(mockBottomNavigationItemNotifier.selectTab(0));
    });
  });
}
