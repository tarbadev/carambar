import 'base_view_tester.dart';
import 'header_tester.dart';

class HomeTabTester extends BaseViewTester {
  final _plus1YearButtonKey = 'Home__Plus1YearButton';

  HomeTabTester(tester): super(tester);

  bool get isVisible => widgetExists(_plus1YearButtonKey);
  HeaderTester get header => HeaderTester(tester);

  Future<void> tapOnPlus1Year() async {
    await tapOnButtonByKey(_plus1YearButtonKey);
    await tester.pump();
  }

  Future<void> goTo() async {
    await tapOnTextWidgetByTextContent('Home');
    await tester.pump();
  }
}