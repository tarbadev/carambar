import 'package:carambar/domain/age_event.dart';
import 'package:equatable/equatable.dart';

class CharacterLife extends Equatable {
  final List<AgeEvent> ageEvents;

  CharacterLife(this.ageEvents);

  @override
  List<Object> get props => [ageEvents];

  CharacterLife addAgeEvent(AgeEvent ageEvent) {
    if (ageEvents.length >= 1 && ageEvents.last.age == ageEvent.age) {
      final ageEventToAdd = ageEvents.last.addLifeEvents(ageEvent.lifeEvents);

      return CharacterLife(List.from(ageEvents)..[ageEvents.length - 1] = ageEventToAdd);
    } else {
      return CharacterLife(ageEvents..add(ageEvent));
    }
  }
}
