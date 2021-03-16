import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  HomeTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Loading...'),
      bottomNavigationBar: MaterialButton(
        key: Key('Home__AgeButton'),
        color: Colors.lightBlue,
        child: Text(
          '+1 year',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
