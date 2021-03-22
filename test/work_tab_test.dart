import 'package:carambar/career_utils.dart';
import 'package:carambar/character_provider.dart';
import 'package:carambar/domain/work/job.dart';
import 'package:carambar/work_tab.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:test_helpers/work_tab_tester.dart';

import 'utils/fake_definitions.dart';
import 'utils/mock_definitions.dart';
import 'utils/test_factory.dart';
import 'utils/testable_widget.dart';

void main() {
  group('WorkTab', () {
    testWidgets('Calls setJob when taping on a Job', (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(
        WorkTab(),
        providerOverrides: [characterProvider.overrideWithValue(Mocks.mockCharacterNotifier)],
      ));

      var workTabTester = WorkTabTester(tester);
      expect(workTabTester.isJobEnabled(careerJobToString(Dishwasher())), true);

      await workTabTester.startJob(careerJobToString(Dishwasher()));

      verify(Mocks.mockCharacterNotifier.setJob(Dishwasher()));
    });

    testWidgets('Current Job is disabled', (WidgetTester tester) async {
      final character = TestFactory.character(currentJob: Dishwasher());

      await tester.pumpWidget(buildTestableWidget(
        WorkTab(),
        providerOverrides: [
          characterProvider.overrideWithValue(FakeCharacterNotifier(character: character))
        ],
      ));

      var workTabTester = WorkTabTester(tester);
      expect(workTabTester.isJobEnabled(careerJobToString(Dishwasher())), false);
    });
  });
}
