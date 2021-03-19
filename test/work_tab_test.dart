import 'package:carambar/Work.dart';
import 'package:carambar/career_utils.dart';
import 'package:carambar/character.dart';
import 'package:carambar/character_provider.dart';
import 'package:carambar/work_tab.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:test_helpers/work_tab_tester.dart';

import 'fake_definitions.dart';
import 'mock_definitions.dart';
import 'testable_widget.dart';

void main() {
  group('WorkTab', () {
    testWidgets('Calls setJob when taping on a Job', (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(
        WorkTab(),
        providerOverrides: [characterProvider.overrideWithValue(Mocks.mockCharacterNotifier)],
      ));

      var workTabTester = WorkTabTester(tester);
      expect(workTabTester.isJobEnabled(careerJobToString[CareerJob.Dishwasher]), true);

      await workTabTester.startJob(careerJobToString[CareerJob.Dishwasher]);

      verify(Mocks.mockCharacterNotifier.setJob(CareerJob.Dishwasher));
    });

    testWidgets('Current Job is disabled', (WidgetTester tester) async {
      final character = Character(currentJob: CareerJob.Dishwasher);

      await tester.pumpWidget(buildTestableWidget(
        WorkTab(),
        providerOverrides: [characterProvider.overrideWithValue(FakeCharacterNotifier(character: character))],
      ));

      var workTabTester = WorkTabTester(tester);
      expect(workTabTester.isJobEnabled(careerJobToString[CareerJob.Dishwasher]), false);
    });
  });
}
