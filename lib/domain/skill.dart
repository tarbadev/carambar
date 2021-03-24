import 'dart:math';

import 'package:carambar/domain/developed_skill.dart';
import 'package:equatable/equatable.dart';

import 'skill_type.dart';

class Skill extends Equatable {
  final SkillType skill;
  final int level;
  final double progression;

  Skill(this.skill, [this.level = 0, this.progression = 0]);

  Skill makeProgress(LearningLevel learningLevel) {
    if (level == 10) {
      return Skill(skill, level);
    }

    final daysPerMonth = 21.75;
    final months = 12;
    final workDaysInYear = daysPerMonth * months;
    final double levelFactor = _getLearningLevel(learningLevel);
    final double requiredExperience = _getRequiredExperienceForLevel(level + 1);
    final double requiredExperienceWithProgression =
        _getRequiredExperienceForLevelWithProgression(level + 1);
    final double experienceInOneYear = levelFactor * workDaysInYear;

    if (requiredExperienceWithProgression > experienceInOneYear) {
      final double newProgression =
          (requiredExperience * (progression / 100) + experienceInOneYear) / requiredExperience;
      return Skill(skill, level, newProgression * 100);
    } else {
      final newLevel = level + 1;

      if (newLevel == 10) {
        return Skill(skill, newLevel);
      } else {
        final experienceLeft = experienceInOneYear - requiredExperienceWithProgression;
        final requiredExperienceNextLevel = _getRequiredExperienceForLevel(newLevel + 1);

        return Skill(skill, newLevel, experienceLeft / requiredExperienceNextLevel * 100);
      }
    }
  }

  double _getLearningLevel(LearningLevel learningLevel) {
    double levelFactor = 0;

    switch (learningLevel) {
      case LearningLevel.Slow:
        levelFactor = 1;
        break;
      case LearningLevel.Medium:
        levelFactor = 1.5;
        break;
    }

    return levelFactor;
  }

  double _getRequiredExperienceForLevel(int level) {
    final double baseXp = 200;
    final double factor = 2;

    return (baseXp * level) + pow(factor, level);
  }

  double _getRequiredExperienceForLevelWithProgression(int level) {
    final double requiredExperience = _getRequiredExperienceForLevel(level);

    if (progression > 0) {
      final double progressMade = requiredExperience * (progression / 100);
      return requiredExperience - progressMade;
    } else {
      return requiredExperience;
    }
  }

  @override
  List<Object> get props => [skill, level, progression];
}
