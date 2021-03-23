import 'package:carambar/domain/character.dart';
import 'package:carambar/domain/skill.dart';
import 'package:carambar/domain/work/job.dart';

class TestFactory {
  TestFactory._();

  static Character character({
    String firstName = 'John',
    String lastName = 'Doe',
    int age = 35,
    Job currentJob,
    Housing currentHousing = Housing.LivingWithParents,
    List<Skill> skills = const [],
  }) =>
      Character(firstName, lastName, age, currentJob, currentHousing, skills);
}
