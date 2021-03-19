import 'package:carambar/Work.dart';
import 'package:carambar/character.dart';

class TestFactory {
  TestFactory._();

  static Character character({
    String firstName,
    String lastName,
    int age,
    CareerJob currentJob,
    Housing currentHousing = Housing.LivingWithParents,
  }) =>
      Character(firstName, lastName, age, currentJob, currentHousing);
}
