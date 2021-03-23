import 'package:carambar/domain/age_event.dart';
import 'package:carambar/domain/character_life.dart';
import 'package:carambar/domain/life_event.dart';
import 'package:carambar/domain/work/job.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Character', () {
    group('addAgeEvent', () {
      group('When ageEvents is not empty', () {
        test('When no existing ageAgent for this age', () {
          final ageEvent = AgeEvent(24);
          final secondAgeEvent = AgeEvent(25);
          final characterLife = CharacterLife([ageEvent]);
          final expectedCharacterLife = CharacterLife([ageEvent, secondAgeEvent]);

          expect(characterLife.addAgeEvent(secondAgeEvent), expectedCharacterLife);
        });

        test('When there is an existing ageAgent for this age', () {
          final firstEvent = AgeEvent(23, [NewJob(null)]);
          final ageEvent = AgeEvent(24, [NewJob(null)]);
          final secondAgeEvent = AgeEvent(24, [NewJob(AllJobs.dishwasher)]);
          final expectedAgeEvent = AgeEvent(24, [NewJob(null), NewJob(AllJobs.dishwasher)]);
          final characterLife = CharacterLife([firstEvent, firstEvent, ageEvent]);
          final expectedCharacterLife = CharacterLife([firstEvent, firstEvent, expectedAgeEvent]);

          expect(characterLife.addAgeEvent(secondAgeEvent), expectedCharacterLife);
        });
      });

      test('When ageEvents is empty', () {
        final ageEvent = AgeEvent(24);
        final characterLife = CharacterLife([]);
        final expectedCharacterLife = CharacterLife([ageEvent]);

        expect(characterLife.addAgeEvent(ageEvent), expectedCharacterLife);
      });
    });
  });
}
