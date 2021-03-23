import 'package:carambar/character_provider.dart';
import 'package:carambar/housing_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'career_utils.dart';

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
          jobInstanceToJobName(character.currentJob) ?? 'Unemployed',
          valueKey: Key('Character__CurrentCareer'),
        ),
        _LabelAndValue(
          'Current Housing',
          housingToString[character.currentHousing],
          valueKey: Key('Character__CurrentHousing'),
        ),
      ],
    );
  }
}

class _LabelAndValue extends StatelessWidget {
  final String label;
  final String value;
  final Key valueKey;

  const _LabelAndValue(this.label, this.value, {Key key, this.valueKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('$label: '),
        Text(
          value,
          key: valueKey,
        ),
      ],
    );
  }
}
