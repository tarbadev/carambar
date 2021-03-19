import 'package:carambar/domain/work.dart';
import 'package:equatable/equatable.dart';

abstract class LifeEvent {}

class InitiateEvent extends Equatable implements LifeEvent {
  final String firstName;
  final String lastName;

  InitiateEvent(this.firstName, this.lastName);

  @override
  List<Object> get props => [firstName, lastName];
}

class NewJob extends Equatable implements LifeEvent {
  final CareerJob careerJob;

  NewJob(this.careerJob);

  @override
  List<Object> get props => [careerJob];
}

class KickedOutFromParents extends Equatable implements LifeEvent {
  @override
  List<Object> get props => [];
}