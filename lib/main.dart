import 'package:carambar/header.dart';
import 'package:carambar/home_tab.dart';
import 'package:carambar/settings_tab.dart';
import 'package:carambar/work_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'bottom_navigation_item_provider.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carambar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _MainPage(),
    );
  }
}

class _MainPage extends ConsumerWidget {
  _MainPage({Key key}) : super(key: key);

  final tabs = [
    HomeTab(),
    WorkTab(),
    SettingsTab(),
  ];

  @override
  Widget build(BuildContext context, watch) {
    final selectedTab = watch(bottomNavigationItemProvider.state);

    return Scaffold(
      appBar: AppBar(
        title: Header(),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: tabs[selectedTab],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Work',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: selectedTab,
        fixedColor: Colors.lightBlue,
        onTap: context.read(bottomNavigationItemProvider).selectTab,
      ),
    );
  }
}
