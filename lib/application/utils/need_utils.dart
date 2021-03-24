import 'package:carambar/domain/need.dart';
import 'package:carambar/domain/need_type.dart';

const Map<NeedType, String> needToString = {
  NeedType.Hunger: 'Hunger',
  NeedType.Health: 'Health',
  NeedType.Hygiene: 'Hygiene',
  NeedType.Happiness: 'Happiness',
};

String displayNeed(Need need) {
  final needString = needToString[need.need];

  if (needString == null) {
    throw Exception(
      'Need not mapped to string: needString = $needString',
    );
  }

  return '$needString(${need.fulfillment.toStringAsFixed(0)}%)';
}
