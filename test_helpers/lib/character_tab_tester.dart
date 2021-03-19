import 'base_view_tester.dart';

class CharacterTabTester extends BaseViewTester {
  final _containerKey = 'Character';

  CharacterTabTester(tester): super(tester);

  bool get isVisible => widgetExists(_containerKey);
  String get currentCareer => getTextByKey('Character__CurrentCareer');
  String get currentHousing => getTextByKey('Character__CurrentHousing');

  Future<void> goTo() async {
    await tapOnTextWidgetByTextContent('Character');
    await tester.pump();
  }
}