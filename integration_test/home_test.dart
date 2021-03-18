import 'package:carambar/main.dart' as app;
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../test/helper/home_tab_tester.dart';
import '../test/helper/settings_tab_tester.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("Updates the age when taping on +1 year button", (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    final homeTabHelper = HomeTabTester(tester);

    expect(homeTabHelper.isVisible, true);
    expect(homeTabHelper.header.title, 'Jane Doe, 18');

    await homeTabHelper.tapOnPlus1Year();
    await homeTabHelper.tapOnPlus1Year();

    expect(homeTabHelper.header.title, 'Jane Doe, 20');
  });

  testWidgets("Resets the character when taping on end life button", (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    final homeTabHelper = HomeTabTester(tester);
    final settingsTabHelper = SettingsTabTester(tester);

    expect(homeTabHelper.isVisible, true);
    await homeTabHelper.tapOnPlus1Year();
    expect(homeTabHelper.header.title, 'Jane Doe, 19');

    await settingsTabHelper.goTo();
    expect(homeTabHelper.isVisible, false);
    expect(settingsTabHelper.isVisible, true);

    await settingsTabHelper.tapOnEndLife();
    expect(settingsTabHelper.endLifeDialog.isVisible, true);

    await settingsTabHelper.endLifeDialog.confirmEndLife();
    expect(homeTabHelper.isVisible, true);
    expect(settingsTabHelper.isVisible, false);

    expect(homeTabHelper.header.title, 'Jane Doe, 18');
  });
}
