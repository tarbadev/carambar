import 'package:flutter/material.dart';

import 'base_view_tester.dart';

class WorkTabTester extends BaseViewTester {
  final _containerKey = 'Work';

  WorkTabTester(tester): super(tester);

  bool get isVisible => widgetExists(_containerKey);

  Future<void> goTo() async {
    await tapOnTextWidgetByTextContent('Work');
    await tester.pump();
  }

  Future<void> startJob(String careerJobName) async {
    await tapOnTextWidgetByTextContent(careerJobName);
    await tester.pump();
  }

  bool isJobEnabled(String careerJobName) {
    return getWidgetByKey<ListTile>('Work__Job__$careerJobName').enabled;
  }
}