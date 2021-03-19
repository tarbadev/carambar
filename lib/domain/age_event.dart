import 'package:carambar/domain/life_event.dart';
import 'package:equatable/equatable.dart';

class AgeEvent extends Equatable {
  final int age;
  final List<LifeEvent> lifeEvents;

  AgeEvent(this.age, [this.lifeEvents = const []]);

  @override
  List<Object> get props => [age, lifeEvents];

  AgeEvent addLifeEvents(List<LifeEvent> lifeEvents) {
    final List<LifeEvent> newLifeEvents = List.from(this.lifeEvents)..addAll(lifeEvents);
    return AgeEvent(this.age, newLifeEvents);
  }
}
