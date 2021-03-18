import 'package:carambar/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'helper/header_tester.dart';

void main() {
  group('Header', () {
    testWidgets('Displays the character name and age', (WidgetTester tester) async {
      await tester.pumpWidget(ProviderScope(
        child: MaterialApp(home: Header()),
      ));

      final headerHelper = HeaderTester(tester);

      expect(headerHelper.title, 'Jane Doe, 18');
    });
  });
}
