import 'package:carambar/domain/work.dart';
import 'package:carambar/domain/character.dart';

class TestFactory {
  TestFactory._();

  static Character character({
    String firstName = 'John',
    String lastName = 'Doe',
    int age = 35,
    CareerJob currentJob,
    Housing currentHousing = Housing.LivingWithParents,
  }) =>
      Character(firstName, lastName, age, currentJob, currentHousing);
}
