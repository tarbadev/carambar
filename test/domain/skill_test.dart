import 'package:carambar/domain/developed_skill.dart';
import 'package:carambar/domain/skill.dart';
import 'package:carambar/domain/skill_type.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Skill', () {
    group('makeProgress', () {
      test('Changes the level and progression with slow learningLevel', () {
        final skill = Skill(SkillType.Communication, 0, 0);
        final expectedSkill1 = Skill(SkillType.Communication, 1, 14.603960396039604);
        final expectedSkill2 = Skill(SkillType.Communication, 1, 79.20792079207921);
        final expectedSkill3 = Skill(SkillType.Communication, 2, 29.111842105263158);

        expect(skill.makeProgress(LearningLevel.Slow), expectedSkill1);
        expect(expectedSkill1.makeProgress(LearningLevel.Slow), expectedSkill2);
        expect(expectedSkill2.makeProgress(LearningLevel.Slow), expectedSkill3);
      });

      test('Changes the level and progression with medium learningLevel', () {
        final skill = Skill(SkillType.Communication, 0, 0);
        final expectedSkill1 = Skill(SkillType.Communication, 1, 46.9059405940594);
        final expectedSkill2 = Skill(SkillType.Communication, 2, 29.111842105263158);
        final expectedSkill3 = Skill(SkillType.Communication, 2, 93.50328947368422);

        expect(skill.makeProgress(LearningLevel.Medium), expectedSkill1);
        expect(expectedSkill1.makeProgress(LearningLevel.Medium), expectedSkill2);
        expect(expectedSkill2.makeProgress(LearningLevel.Medium), expectedSkill3);
      });

      test('Changes the level and progression with medium learningLevel and stops at level 10', () {
        final skill = Skill(SkillType.Communication, 9, 99.0);
        final expectedSkill = Skill(SkillType.Communication, 10, 0);

        expect(skill.makeProgress(LearningLevel.Medium), expectedSkill);
      });

      test('Does nothing for level 10', () {
        final skill = Skill(SkillType.Communication, 10, 0);

        expect(skill.makeProgress(LearningLevel.Medium), skill);
      });
    });
  });
}
