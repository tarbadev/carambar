import 'package:carambar/career_utils.dart';
import 'package:carambar/character_provider.dart';
import 'package:carambar/domain/developed_skill.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'domain/skill.dart';
import 'domain/skill_type.dart';
import 'domain/work/job.dart';

const Map<SkillType, String> skillToString = {
  SkillType.Organization: 'Organization',
  SkillType.Cooking: 'Cooking',
  SkillType.Communication: 'Communication',
};

const Map<LearningLevel, String> learningLevelToString = {
  LearningLevel.Slow: '+',
  LearningLevel.Medium: '++',
};

String displayRequiredSkill(Skill requiredSkill) {
  final skillString = skillToString[requiredSkill.skill];

  if (skillString == null) {
    throw Exception(
      'RequiredSkill not mapped to string: skillString = $skillString',
    );
  }

  return '$skillString(${requiredSkill.level})';
}

String displayDevelopedSkill(DevelopedSkill developedSkill) {
  final skillString = skillToString[developedSkill.skill];
  final levelString = learningLevelToString[developedSkill.learningLevel];

  if (skillString == null || levelString == null) {
    throw Exception(
      'DevelopedSkill not mapped to string: skillString = $skillString, levelString = $levelString',
    );
  }

  return '$skillString$levelString';
}

class WorkTab extends ConsumerWidget {
  WorkTab({Key key}) : super(key: key);

  void _showJobDialog(context, Job job) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
                key: Key('JobDialog'),
                title: Text(jobInstanceToJobName(job)),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (job.requiredSkills.length > 0)
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Required Skills: '),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: job.requiredSkills
                                  .asMap()
                                  .entries
                                  .map((entry) => Text(
                                        displayRequiredSkill(entry.value),
                                        textAlign: TextAlign.start,
                                        key: Key('JobDialog__RequiredSkill__${entry.key}'),
                                      ))
                                  .toList(),
                            )
                          ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Developed Skills: '),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: job.developedSkills
                              .asMap()
                              .entries
                              .map((entry) => Text(
                                    displayDevelopedSkill(entry.value),
                                    key: Key('JobDialog__DevelopedSkill__${entry.key}'),
                                  ))
                              .toList(),
                        )
                      ],
                    ),
                  ],
                ),
                actions: <Widget>[
                  TextButton(
                    key: Key('JobDialog__CancelButton'),
                    child: Text('Cancel'),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  MaterialButton(
                    elevation: 2,
                    color: ThemeData.light().primaryColor,
                    textTheme: ButtonTextTheme.primary,
                    key: Key('JobDialog__ApplyButton'),
                    child: Text('Apply'),
                    onPressed: () {
                      context.read(characterProvider).setJob(job);
                      Navigator.of(context).pop();
                    },
                  ),
                ]));
  }

  @override
  Widget build(BuildContext context, watch) {
    final character = watch(characterProvider.state);

    return Container(
      key: Key('Work'),
      child: ListView.separated(
        separatorBuilder: (context, index) => Divider(color: Colors.grey, height: 2),
        key: Key('Work__AvailableJobs'),
        itemCount: jobs.length,
        itemBuilder: (BuildContext context, int index) {
          final job = jobs[index];
          final jobName = jobInstanceToJobName(jobs[index]);
          final jobEnabled =
              job.areRequiredSkillsMet(character.skills) && character.currentJob != job;

          return ListTile(
            key: Key('Work__Job__$jobName'),
            title: Text(jobName),
            onTap: () => _showJobDialog(context, job),
            enabled: jobEnabled,
          );
        },
      ),
    );
  }
}
