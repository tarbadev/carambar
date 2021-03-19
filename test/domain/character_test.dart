import 'package:carambar/domain/character.dart';
import 'package:flutter_test/flutter_test.dart';

import '../utils/test_factory.dart';

void main() {
  group('Character', () {
    group('incrementAge', () {
      test('Changes the housing when turning 25 and living with parents', () {
        final character = TestFactory.character(age: 24, currentHousing: Housing.LivingWithParents);
        final expectedCharacter = TestFactory.character(age: 25, currentHousing: Housing.Homeless);

        expect(character.incrementAge(), expectedCharacter);
      });
    });
  });
}