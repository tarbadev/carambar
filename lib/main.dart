import 'package:carambar/home_tab.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
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

class _MainPage extends StatefulWidget {
  _MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<_MainPage> {
  final String _name = 'Jane Doe';
  final int _age = 18;
  int _selectedTab = 0;

  final tabs = [
    HomeTab(),
  ];

  void _tabSelected(newTabIndex) {
    setState(() {
      _selectedTab = newTabIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          Text(
            '$_name, $_age',
          ),
        ]),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: tabs[_selectedTab],
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
            label: 'Jobs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedTab,
        fixedColor: Colors.lightBlue,
        onTap: _tabSelected,
      ),
    );
  }
}
