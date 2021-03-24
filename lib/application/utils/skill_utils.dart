import 'package:carambar/domain/skill.dart';
import 'package:carambar/domain/skill_type.dart';

const Map<SkillType, String> skillToString = {
  SkillType.Organization: 'Organization',
  SkillType.Cooking: 'Cooking',
  SkillType.Communication: 'Communication',
};

String displaySkill(Skill skill) {
  final skillString = skillToString[skill.skill];

  if (skillString == null) {
    throw Exception(
      'Skill not mapped to string: skillString = $skillString',
    );
  }

  var progression = '';

  if (skill.progression > 0) {
    progression = ', ${skill.progression.toStringAsFixed(2)}%';
  }

  return '$skillString(${skill.level}$progression)';
}