import 'package:carambar/bottom_navigation_item_provider.dart';
import 'package:carambar/character_provider.dart';
import 'package:mockito/mockito.dart';

class _MockCharacterNotifier extends Mock implements CharacterNotifier {}

class _MockBottomNavigationItemNotifier extends Mock implements BottomNavigationItemNotifier {}

class Mocks {
  static final mockCharacterNotifier = _MockCharacterNotifier();
  static final mockBottomNavigationItemNotifier = _MockBottomNavigationItemNotifier();
}
