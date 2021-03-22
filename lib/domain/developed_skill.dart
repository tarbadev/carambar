import 'skill.dart';

enum LearningLevel {
  Slow,
}

class DevelopedSkill {
  final Skill skill;
  final LearningLevel learningLevel;

  DevelopedSkill(this.skill, this.learningLevel);
}