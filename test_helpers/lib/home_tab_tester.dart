import 'base_view_tester.dart';
import 'header_tester.dart';

class HomeTabTester extends BaseViewTester {
  final _plus1YearButtonKey = 'Home__Plus1YearButton';

  HomeTabTester(tester): super(tester);

  bool get isVisible => widgetExists(_plus1YearButtonKey);
  HeaderTester get header => HeaderTester(tester);

  _LifeEventTester lifeEvent(int age) => _LifeEventTester(tester, age);

  Future<void> tapOnPlus1Year() async {
    await tapOnButtonByKey(_plus1YearButtonKey);
    await tester.pump();
  }

  Future<void> goTo() async {
    await tapOnTextWidgetByTextContent('Home');
    await tester.pump();
  }
}

class _LifeEventTester extends BaseViewTester {
  final int age;
  String _key;

  _LifeEventTester(tester, this.age): super(tester) {
    _key = 'LifeEventItem__$age';
  }

  bool get isVisible => widgetExists(_key);
  String get title => getTextByKey('${_key}__Title');

  List<String> get events {
    List<String> events = [];
    try {
      var index = 0;
      do {
        events.add(getTextByKey('${_key}__Event__${index++}'));
      } while (true);
    } catch (_) {}

    return events;
  }
}