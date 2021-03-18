import 'base_view_tester.dart';

class SettingsTabTester extends BaseViewTester {
  final _endLifeButtonKey = 'Settings__EndLifeButton';

  SettingsTabTester(tester): super(tester);

  bool get isVisible => widgetExists(_endLifeButtonKey);
  _EndLifeDialogElement get endLifeDialog => _EndLifeDialogElement(tester);

  Future<void> tapOnEndLife() async {
    await tapOnButtonByKey(_endLifeButtonKey);
    await tester.pump();
  }

  Future<void> goTo() async {
    await tapOnElementByText('Settings');
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