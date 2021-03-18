import 'base_view_tester.dart';

class HeaderTester extends BaseViewTester {
  HeaderTester(tester): super(tester);

  String get title => getTextByKey('Header__Title');
}