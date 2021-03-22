import 'package:carambar/domain/skill.dart';

import '../developed_skill.dart';
import '../required_skill.dart';

abstract class Job {
  final double yearlySalary;
  final List<RequiredSkill> requiredSkills;
  final List<DevelopedSkill> developedSkills;

  Job(this.yearlySalary, this.requiredSkills, this.developedSkills);
}

class Dishwasher extends Job {
  Dishwasher(): super(15000, [], [DevelopedSkill(Skill.Organization, LearningLevel.Slow)]);
}