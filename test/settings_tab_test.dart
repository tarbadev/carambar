import 'package:carambar/bottom_navigation_item_provider.dart';
import 'package:carambar/character_life_provider.dart';
import 'package:carambar/settings_tab.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:test_helpers/settings_tab_tester.dart';

import 'utils/mock_definitions.dart';
import 'utils/testable_widget.dart';

void main() {
  group('SettingsTab', () {
    testWidgets('Calls character reset method', (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(
        SettingsTab(),
        providerOverrides: [
          characterLifeProvider.overrideWithValue(Mocks.mockCharacterLifeNotifier),
          bottomNavigationItemProvider.overrideWithValue(Mocks.mockBottomNavigationItemNotifier)
        ],
      ));

      final settingsTabHelper = SettingsTabTester(tester);
      await settingsTabHelper.tapOnEndLife();

      expect(settingsTabHelper.endLifeDialog.isVisible, true);

      await settingsTabHelper.endLifeDialog.confirmEndLife();

      expect(settingsTabHelper.endLifeDialog.isVisible, false);
      verify(Mocks.mockCharacterLifeNotifier.reset());
      verify(Mocks.mockBottomNavigationItemNotifier.selectTab(0));
    });
  });
}
