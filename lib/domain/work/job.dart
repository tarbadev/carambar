import 'package:carambar/domain/skill.dart';

import '../developed_skill.dart';
import '../required_skill.dart';

class AllJobs {
  AllJobs._();

  static final dishwasher = _Dishwasher();
  static final juniorCook = _JuniorCook();
}

final jobs = [AllJobs.dishwasher, AllJobs.juniorCook];

abstract class Job {
  final double yearlySalary;
  final List<RequiredSkill> requiredSkills;
  final List<DevelopedSkill> developedSkills;

  Job(this.yearlySalary, this.requiredSkills, this.developedSkills);
}

class _Dishwasher extends Job {
  _Dishwasher() : super(15000, [], [DevelopedSkill(Skill.Organization, LearningLevel.Slow)]);
}

class _JuniorCook extends Job {
  _JuniorCook()
      : super(
          20000,
          [RequiredSkill(Skill.Organization, 2)],
          [
            DevelopedSkill(Skill.Organization, LearningLevel.Medium),
            DevelopedSkill(Skill.Cooking, LearningLevel.Medium),
            DevelopedSkill(Skill.Communication, LearningLevel.Slow),
          ],
        );
}
