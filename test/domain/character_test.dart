import 'package:carambar/domain/character.dart';
import 'package:carambar/domain/skill.dart';
import 'package:carambar/domain/skill_type.dart';
import 'package:carambar/domain/work/job.dart';
import 'package:flutter_test/flutter_test.dart';

import '../utils/test_factory.dart';

void main() {
  group('Character', () {
    group('incrementAge', () {
      test('Changes the housing when turning 25 and living with parents', () {
        final character = TestFactory.character(age: 24, currentHousing: Housing.LivingWithParents);
        final expectedCharacter = TestFactory.character(age: 25, currentHousing: Housing.Homeless);

        expect(character.incrementAge(), expectedCharacter);
      });

      test('Improves the skills given a job when the skill is not already present', () {
        final character =
            TestFactory.character(age: 18, currentJob: AllJobs.dishwasher, skills: []);
        final expectedCharacter = TestFactory.character(
          age: 19,
          currentJob: AllJobs.dishwasher,
          skills: [Skill(SkillType.Organization, 1, 14.603960396039604)],
        );

        expect(character.incrementAge(), expectedCharacter);
      });

      test('Improves the skills given a job when the skill is already present', () {
        final character =
            TestFactory.character(age: 18, currentJob: AllJobs.dishwasher, skills: [Skill(SkillType.Organization, 1, 14.603960396039604)]);
        final expectedCharacter = TestFactory.character(
          age: 19,
          currentJob: AllJobs.dishwasher,
          skills: [Skill(SkillType.Organization, 1, 79.20792079207921)],
        );

        expect(character.incrementAge(), expectedCharacter);
      });
    });
  });
}
