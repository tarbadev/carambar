import 'package:carambar/character_provider.dart';
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
        Row(
          children: [
            Text('Current Job: '),
            Text(
              careerJobToString[character.currentJob] ?? 'Unemployed',
              key: Key('Character__CurrentCareer'),
            ),
          ],
        )
      ],
    );
  }
}
