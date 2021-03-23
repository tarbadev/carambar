import 'package:carambar/domain/skill_type.dart';

import '../developed_skill.dart';
import '../skill.dart';

class AllJobs {
  AllJobs._();

  static final dishwasher = _Dishwasher();
  static final juniorCook = _JuniorCook();
}

final jobs = [AllJobs.dishwasher, AllJobs.juniorCook];

abstract class Job {
  final double yearlySalary;
  final List<Skill> requiredSkills;
  final List<DevelopedSkill> developedSkills;

  Job(this.yearlySalary, this.requiredSkills, this.developedSkills);

  bool areRequiredSkillsMet(List<Skill> skills) {
    bool result = true;

    for (Skill requiredSkill in requiredSkills) {
      final skill = skills.firstWhere((s) => s.skill == requiredSkill.skill, orElse: () => null);
      if (skill == null || skill.level < requiredSkill.level) {
        result = false;
        break;
      }
    }

    return result;
  }
}

class _Dishwasher extends Job {
  _Dishwasher() : super(15000, [], [DevelopedSkill(SkillType.Organization, LearningLevel.Slow)]);
}

class _JuniorCook extends Job {
  _JuniorCook()
      : super(
          20000,
          [Skill(SkillType.Organization, 2)],
          [
            DevelopedSkill(SkillType.Organization, LearningLevel.Medium),
            DevelopedSkill(SkillType.Cooking, LearningLevel.Medium),
            DevelopedSkill(SkillType.Communication, LearningLevel.Slow),
          ],
        );
}
