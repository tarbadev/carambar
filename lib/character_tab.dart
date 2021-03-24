import 'package:carambar/character_provider.dart';
import 'package:carambar/application/utils/housing_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'application/utils/need_utils.dart';
import 'application/utils/skill_utils.dart';
import 'application/utils/career_utils.dart';

class CharacterTab extends ConsumerWidget {
  CharacterTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final character = watch(characterProvider.state);

    return Column(
      key: Key('Character'),
      children: [
        _LabelAndValue(
          'Current Job',
          Text(
            jobInstanceToJobName(character.currentJob) ?? 'Unemployed',
            key: Key('Character__CurrentCareer'),
          ),
        ),
        _LabelAndValue(
          'Current Housing',
          Text(
            housingToString[character.currentHousing],
            key: Key('Character__CurrentHousing'),
          ),
        ),
        _LabelAndValue(
          'Skills',
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: character.skills
                .asMap()
                .entries
                .map((entry) => Text(
                      displaySkill(entry.value),
                      key: Key('Character__Skill__${entry.key}'),
                    ))
                .toList(),
          ),
        ),
        _LabelAndValue(
          'Needs',
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: character.needs
                .asMap()
                .entries
                .map((entry) => Text(
                      displayNeed(entry.value),
                      key: Key('Character__Need__${entry.key}'),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}

class _LabelAndValue extends StatelessWidget {
  final String label;
  final Widget value;

  const _LabelAndValue(this.label, this.value, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$label: '),
        value,
      ],
    );
  }
}
