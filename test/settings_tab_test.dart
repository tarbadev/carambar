import 'package:carambar/bottom_navigation_item_provider.dart';
import 'package:carambar/character_provider.dart';
import 'package:carambar/settings_tab.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:test_helpers/settings_tab_tester.dart';

import 'mock_definitions.dart';
import 'testable_widget.dart';

void main() {
  group('SettingsTab', () {
    testWidgets('Calls character reset method', (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(
        SettingsTab(),
        providerOverrides: [
          characterProvider.overrideWithValue(Mocks.mockCharacterNotifier),
          bottomNavigationItemProvider.overrideWithValue(Mocks.mockBottomNavigationItemNotifier)
        ],
      ));

      final settingsTabHelper = SettingsTabTester(tester);
      await settingsTabHelper.tapOnEndLife();

      expect(settingsTabHelper.endLifeDialog.isVisible, true);

      await settingsTabHelper.endLifeDialog.confirmEndLife();

      expect(settingsTabHelper.endLifeDialog.isVisible, false);
      verify(Mocks.mockCharacterNotifier.reset());
      verify(Mocks.mockBottomNavigationItemNotifier.selectTab(0));
    });
  });
}
