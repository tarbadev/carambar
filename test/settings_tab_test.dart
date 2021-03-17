import 'package:carambar/character_provider.dart';
import 'package:carambar/settings_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'helper/base_view_tester.dart';

class _MockCharacterNotifier extends Mock implements CharacterNotifier {}

class _SettingsTabHelper extends BaseViewTester {
  _SettingsTabHelper(tester): super(tester);

  _EndLifeDialogElement get endLifeDialog => _EndLifeDialogElement(tester);

  Future<void> tapOnEndLife() async {
    await tapOnButtonByKey('Settings__EndLifeButton');
    await tester.pump();
  }
}

class _EndLifeDialogElement extends BaseViewTester {
  _EndLifeDialogElement(tester): super(tester);

  bool get isVisible => widgetExists('EndLifeDialog');

  Future<void> confirmEndLife() async {
    await tapOnButtonByKey('EndLifeDialog__ConfirmButton');
    await tester.pump();
  }
}

void main() {
  group('SettingsTab', () {
    testWidgets('Calls character reset method', (WidgetTester tester) async {
      var mockCharacterNotifier = _MockCharacterNotifier();
      await tester.pumpWidget(ProviderScope(
        overrides: [
          characterProvider.overrideWithValue(mockCharacterNotifier)
        ],
        child: MaterialApp(home: SettingsTab()),
      ));

      final settingsTabHelper = _SettingsTabHelper(tester);
      await settingsTabHelper.tapOnEndLife();

      expect(settingsTabHelper.endLifeDialog.isVisible, true);

      await settingsTabHelper.endLifeDialog.confirmEndLife();

      expect(settingsTabHelper.endLifeDialog.isVisible, false);
      verify(mockCharacterNotifier.reset());
    });
  });
}
