import 'package:carambar/character_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeTab extends ConsumerWidget {
  HomeTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    return Scaffold(
      body: Text('Loading...'),
      bottomNavigationBar: MaterialButton(
        key: Key('Home__AgeButton'),
        color: Colors.lightBlue,
        child: Text(
          '+1 year',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () => context.read(characterProvider).age(),
      ),
    );
  }
}
