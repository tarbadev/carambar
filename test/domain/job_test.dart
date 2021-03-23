import 'package:carambar/domain/skill.dart';
import 'package:carambar/domain/skill_type.dart';
import 'package:carambar/domain/work/job.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Job', () {
    group('areRequiredSkillsMet', () {
      test('Returns true when skills are at least required', () {
        final skills = [Skill(SkillType.Organization, 2)];

        expect(AllJobs.juniorCook.areRequiredSkillsMet(skills), true);
      });

      test('Returns false when skills are not of the right level', () {
        final skills = [Skill(SkillType.Cooking, 1)];

        expect(AllJobs.juniorCook.areRequiredSkillsMet(skills), false);
      });
    });
  });
}
