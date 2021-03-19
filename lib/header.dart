import 'package:carambar/domain/character.dart';
import 'package:carambar/character_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Header extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    final Character character = watch(characterProvider.state);

    return Row(children: [
      Text(
        '${character.firstName} ${character.lastName}, ${character.age}',
        key: Key('Header__Title'),
      ),
    ]);
  }
}
