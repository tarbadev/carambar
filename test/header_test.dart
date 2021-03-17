import 'package:carambar/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'helper/base_view_tester.dart';

class _HeaderHelper extends BaseViewTester {
  _HeaderHelper(tester): super(tester);

  String get title => getTextByKey('Header__Title');
}

void main() {
  group('Header', () {
    testWidgets('Displays the character name and age', (WidgetTester tester) async {
      await tester.pumpWidget(ProviderScope(
        child: MaterialApp(home: Header()),
      ));

      final headerHelper = _HeaderHelper(tester);

      expect(headerHelper.title, 'Jane Doe, 18');
    });
  });
}
