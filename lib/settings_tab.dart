import 'package:carambar/character_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsTab extends ConsumerWidget {
  SettingsTab({Key key}) : super(key: key);

  void _showEndLifeDialog(context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
                key: Key('EndLifeDialog'),
                title: Text('End Life ?'),
                content: Text(
                    'Are you sure you want to end the life of your character?\nA new character will be generated'),
                actions: <Widget>[
                  TextButton(
                    key: Key('EndLifeDialog__CancelButton'),
                    child: Text('Nevermind...'),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  MaterialButton(
                    elevation: 2,
                    color: ThemeData.light().primaryColor,
                    textTheme: ButtonTextTheme.primary,
                    key: Key('EndLifeDialog__ConfirmButton'),
                    child: Text('I\'m done with it!'),
                    onPressed: () {
                      context.read(characterProvider).reset();
                      Navigator.of(context).pop();
                    },
                  ),
                ]));
  }

  @override
  Widget build(BuildContext context, watch) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            child: MaterialButton(
              elevation: 2,
              color: ThemeData.light().primaryColor,
              textTheme: ButtonTextTheme.primary,
              child: Text('End Life'),
              key: Key('Settings__EndLifeButton'),
              onPressed: () => _showEndLifeDialog(context),
            ),
          ),
        ],
      ),
    );
  }
}
