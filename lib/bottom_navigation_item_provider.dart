import 'package:flutter_riverpod/flutter_riverpod.dart';

final bottomNavigationItemProvider = StateNotifierProvider((_) => BottomNavigationItemNotifier());

class BottomNavigationItemNotifier extends StateNotifier<int> {
  BottomNavigationItemNotifier(): super(0);

  void selectTab(int newTab) {
    state = newTab;
  }
}