import 'package:carambar/character_tab.dart';
import 'package:carambar/header.dart';
import 'package:carambar/home_tab.dart';
import 'package:carambar/settings_tab.dart';
import 'package:carambar/work_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'character_life_provider.dart';
import 'bottom_navigation_item_provider.dart';

void main() {
  runApp(ProviderScope(child: CarambarApp()));
}

class CarambarApp extends StatelessWidget {
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
    CharacterTab(),
    WorkTab(),
    SettingsTab(),
  ];

  @override
  Widget build(BuildContext context, watch) {
    final ageEvents = watch(characterLifeProvider.state).ageEvents;

    if (ageEvents.length == 0) {
      return _loadingEvents();
    }

    final selectedTab = watch(bottomNavigationItemProvider.state);

    return Scaffold(
      appBar: AppBar(
        title: Header(),
      ),
      body: Container(
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
            icon: Icon(Icons.person),
            label: 'Character',
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

  Center _loadingEvents() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text('Loading...'),
          ),
        ],
      ),
    );
  }
}
