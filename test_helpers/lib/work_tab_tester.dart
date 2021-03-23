import 'package:flutter/material.dart';

import 'base_view_tester.dart';

class WorkTabTester extends BaseViewTester {
  final _containerKey = 'Work';

  WorkTabTester(tester): super(tester);

  bool get isVisible => widgetExists(_containerKey);
  _JobDialogElement get jobDialog => _JobDialogElement(tester);

  Future<void> goTo() async {
    await tapOnTextWidgetByTextContent('Work');
    await tester.pump();
  }

  Future<void> displayJobDialog(String careerJobName) async {
    await tapOnTextWidgetByTextContent(careerJobName);
    await tester.pump();
  }

  bool isJobEnabled(String careerJobName) {
    return getWidgetByKey<ListTile>('Work__Job__$careerJobName').enabled;
  }
}

class _JobDialogElement extends BaseViewTester {
  _JobDialogElement(tester): super(tester);

  bool get isVisible => widgetExists('JobDialog');

  Future<void> applyForJob() async {
    await tapOnButtonByKey('JobDialog__ApplyButton');
    await tester.pump();
  }
}