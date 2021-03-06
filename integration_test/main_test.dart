import 'package:carambar/application/utils/career_utils.dart';
import 'package:carambar/domain/work/job.dart';
import 'package:carambar/main.dart' as app;
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:test_helpers/character_tab_tester.dart';
import 'package:test_helpers/home_tab_tester.dart';
import 'package:test_helpers/settings_tab_tester.dart';
import 'package:test_helpers/work_tab_tester.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("Updates the age when taping on +1 year button", (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    final homeTabTester = HomeTabTester(tester);

    expect(homeTabTester.isVisible, true);
    expect(homeTabTester.header.title, 'Jane Doe, 18');

    final lifeEvent = homeTabTester.lifeEvent(18);
    expect(lifeEvent.isVisible, true);
    expect(lifeEvent.title, 'Age 18');
    expect(lifeEvent.events, [
      '''
      Your life just started!
      Your name is Jane Doe
      '''
          .split('\n')
          .map((line) => line.trim())
          .reduce((line1, line2) => line2.isNotEmpty ? '$line1\n$line2' : line1)
    ]);

    await homeTabTester.tapOnPlus1Year();
    await homeTabTester.tapOnPlus1Year();

    expect(homeTabTester.header.title, 'Jane Doe, 20');
  });

  testWidgets("Resets the character when taping on end life button", (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    final homeTabTester = HomeTabTester(tester);
    final settingsTabTester = SettingsTabTester(tester);

    expect(homeTabTester.isVisible, true);
    await homeTabTester.tapOnPlus1Year();
    expect(homeTabTester.header.title, 'Jane Doe, 19');

    await settingsTabTester.goTo();
    expect(homeTabTester.isVisible, false);
    expect(settingsTabTester.isVisible, true);

    await settingsTabTester.tapOnEndLife();
    expect(settingsTabTester.endLifeDialog.isVisible, true);

    await settingsTabTester.endLifeDialog.confirmEndLife();
    expect(homeTabTester.isVisible, true);
    expect(settingsTabTester.isVisible, false);

    expect(homeTabTester.header.title, 'Jane Doe, 18');
  });

  testWidgets("Starts a job as Dishwasher", (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    final characterTabTester = CharacterTabTester(tester);
    final workTabTester = WorkTabTester(tester);
    final homeTabTester = HomeTabTester(tester);

    await characterTabTester.goTo();
    expect(characterTabTester.isVisible, true);
    expect(characterTabTester.currentCareer, 'Unemployed');

    await workTabTester.goTo();
    expect(workTabTester.isVisible, true);

    await workTabTester.displayJobDialog(jobInstanceToJobName(AllJobs.dishwasher));
    expect(workTabTester.jobDialog.isVisible, true);
    expect(workTabTester.jobDialog.developedSkills, ['Organization+']);

    await workTabTester.jobDialog.applyForJob();

    await characterTabTester.goTo();
    expect(characterTabTester.isVisible, true);
    expect(characterTabTester.currentCareer, 'Dishwasher');

    await homeTabTester.goTo();
    final lifeEvent = homeTabTester.lifeEvent(18);
    expect(lifeEvent.isVisible, true);
    expect(lifeEvent.title, 'Age 18');
    expect(lifeEvent.events.last, 'You just started a new job as Dishwasher');
  });

  testWidgets("Job increases skills", (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    final characterTabTester = CharacterTabTester(tester);
    final workTabTester = WorkTabTester(tester);
    final homeTabTester = HomeTabTester(tester);

    await workTabTester.goTo();
    await workTabTester.displayJobDialog(jobInstanceToJobName(AllJobs.dishwasher));
    await workTabTester.jobDialog.applyForJob();

    await characterTabTester.goTo();
    expect(characterTabTester.isVisible, true);
    expect(characterTabTester.currentCareer, 'Dishwasher');
    expect(characterTabTester.skills, []);

    await homeTabTester.goTo();
    await homeTabTester.tapOnPlus1Year();

    await characterTabTester.goTo();
    expect(characterTabTester.isVisible, true);
    expect(characterTabTester.currentCareer, 'Dishwasher');
    expect(characterTabTester.skills, ['Organization(1, 14.60%)']);
  });

  testWidgets("Displays the character needs", (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    final characterTabTester = CharacterTabTester(tester);

    await characterTabTester.goTo();
    expect(characterTabTester.isVisible, true);
    expect(characterTabTester.needs, [
      'Hunger(100%)',
      'Hygiene(100%)',
      'Health(100%)',
      'Happiness(100%)',
    ]);
  });

  testWidgets("Is kicked out of the house at 25", (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    final characterTabTester = CharacterTabTester(tester);
    final homeTabTester = HomeTabTester(tester);

    await characterTabTester.goTo();
    expect(characterTabTester.isVisible, true);
    expect(characterTabTester.currentHousing, 'Living with parents');

    await homeTabTester.goTo();
    await homeTabTester.tapOnPlus1Year();
    await homeTabTester.tapOnPlus1Year();
    await homeTabTester.tapOnPlus1Year();
    await homeTabTester.tapOnPlus1Year();
    await homeTabTester.tapOnPlus1Year();
    await homeTabTester.tapOnPlus1Year();
    await homeTabTester.tapOnPlus1Year();

    expect(homeTabTester.header.title, 'Jane Doe, 25');

    await characterTabTester.goTo();
    expect(characterTabTester.isVisible, true);
    expect(characterTabTester.currentHousing, 'Homeless');

    await homeTabTester.goTo();
    final lifeEvent = homeTabTester.lifeEvent(25);
    expect(lifeEvent.isVisible, true);
    expect(lifeEvent.title, 'Age 25');
    expect(lifeEvent.events, [
      'You got kicked out of the house by your parents! You\'re now homeless',
    ]);
  });
}
