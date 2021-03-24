import 'package:carambar/domain/skill_type.dart';

import '../developed_skill.dart';
import '../skill.dart';

class AllJobs {
  AllJobs._();

  static final dishwasher = _Dishwasher();
  static final juniorCook = _JuniorCook();
  static final lineCook = _LineCook();
  static final sectionCook = _SectionCook();
  static final sousChef = _SousChef();
  static final chef = _Chef();
  static final starredChef = _StarredChef();
}

final jobs = [
  AllJobs.dishwasher,
  AllJobs.juniorCook,
  AllJobs.lineCook,
  AllJobs.sectionCook,
  AllJobs.sousChef,
  AllJobs.chef,
  AllJobs.starredChef,
];

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

class _LineCook extends Job {
  _LineCook()
      : super(
          25000,
          [
            Skill(SkillType.Organization, 3),
            Skill(SkillType.Cooking, 3),
          ],
          [
            DevelopedSkill(SkillType.Organization, LearningLevel.Medium),
            DevelopedSkill(SkillType.Cooking, LearningLevel.Medium),
            DevelopedSkill(SkillType.Communication, LearningLevel.Medium),
          ],
        );
}

class _SectionCook extends Job {
  _SectionCook()
      : super(
          35000,
          [
            Skill(SkillType.Organization, 5),
            Skill(SkillType.Cooking, 5),
            Skill(SkillType.Communication, 3),
          ],
          [
            DevelopedSkill(SkillType.Organization, LearningLevel.Medium),
            DevelopedSkill(SkillType.Cooking, LearningLevel.Medium),
            DevelopedSkill(SkillType.Communication, LearningLevel.Medium),
            DevelopedSkill(SkillType.Management, LearningLevel.Medium),
          ],
        );
}

class _SousChef extends Job {
  _SousChef()
      : super(
          50000,
          [
            Skill(SkillType.Organization, 7),
            Skill(SkillType.Cooking, 7),
            Skill(SkillType.Communication, 5),
            Skill(SkillType.Management, 3),
          ],
          [
            DevelopedSkill(SkillType.Organization, LearningLevel.Medium),
            DevelopedSkill(SkillType.Cooking, LearningLevel.Medium),
            DevelopedSkill(SkillType.Communication, LearningLevel.Medium),
            DevelopedSkill(SkillType.Management, LearningLevel.Medium),
          ],
        );
}

class _Chef extends Job {
  _Chef()
      : super(
          60000,
          [
            Skill(SkillType.Organization, 8),
            Skill(SkillType.Cooking, 8),
            Skill(SkillType.Communication, 7),
            Skill(SkillType.Management, 5),
          ],
          [
            DevelopedSkill(SkillType.Organization, LearningLevel.Medium),
            DevelopedSkill(SkillType.Cooking, LearningLevel.Medium),
            DevelopedSkill(SkillType.Communication, LearningLevel.Medium),
            DevelopedSkill(SkillType.Management, LearningLevel.Medium),
          ],
        );
}

class _StarredChef extends Job {
  _StarredChef()
      : super(
          85000,
          [
            Skill(SkillType.Organization, 10),
            Skill(SkillType.Cooking, 10),
            Skill(SkillType.Communication, 10),
            Skill(SkillType.Management, 8),
          ],
          [
            DevelopedSkill(SkillType.Management, LearningLevel.Medium),
          ],
        );
}
