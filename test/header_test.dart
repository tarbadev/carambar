import 'package:carambar/header.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_helpers/header_tester.dart';

import 'testable_widget.dart';

void main() {
  group('Header', () {
    testWidgets('Displays the character name and age', (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(Header()));

      final headerHelper = HeaderTester(tester);

      expect(headerHelper.title, 'Jane Doe, 18');
    });
  });
}
