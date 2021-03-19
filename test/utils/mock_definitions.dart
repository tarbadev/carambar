import 'package:carambar/character_life_provider.dart';
import 'package:carambar/bottom_navigation_item_provider.dart';
import 'package:carambar/character_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mockito/mockito.dart';

class _MockCharacterNotifier extends Mock implements CharacterNotifier {}
class _MockCharacterLifeNotifier extends Mock implements CharacterLifeNotifier {}

class _MockBottomNavigationItemNotifier extends Mock implements BottomNavigationItemNotifier {}
// ignore: subtype_of_sealed_class
class _MockProviderReference extends Mock implements ProviderReference {}

class Mocks {
  static final mockCharacterNotifier = _MockCharacterNotifier();
  static final mockCharacterLifeNotifier = _MockCharacterLifeNotifier();
  static final mockBottomNavigationItemNotifier = _MockBottomNavigationItemNotifier();
  static final mockProviderReference = _MockProviderReference();
}
