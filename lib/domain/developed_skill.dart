import 'skill_type.dart';

enum LearningLevel {
  Slow,
  Medium,
}

class DevelopedSkill {
  final SkillType skill;
  final LearningLevel learningLevel;

  DevelopedSkill(this.skill, this.learningLevel);
}