import 'package:carambar/domain/skill.dart';

import '../developed_skill.dart';
import '../required_skill.dart';

class AllJobs {
  AllJobs._();

  static final dishwasher = _Dishwasher();
}

final jobs = [AllJobs.dishwasher];

abstract class Job {
  final double yearlySalary;
  final List<RequiredSkill> requiredSkills;
  final List<DevelopedSkill> developedSkills;

  Job(this.yearlySalary, this.requiredSkills, this.developedSkills);
}

class _Dishwasher extends Job {
  _Dishwasher(): super(15000, [], [DevelopedSkill(Skill.Organization, LearningLevel.Slow)]);
}