import 'skill.dart';

enum LearningLevel {
  Slow,
  Medium,
}

class DevelopedSkill {
  final Skill skill;
  final LearningLevel learningLevel;

  DevelopedSkill(this.skill, this.learningLevel);
}