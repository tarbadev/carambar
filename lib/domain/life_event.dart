import 'package:equatable/equatable.dart';

import 'work/job.dart';

abstract class LifeEvent {}

class InitiateEvent extends Equatable implements LifeEvent {
  final String firstName;
  final String lastName;

  InitiateEvent(this.firstName, this.lastName);

  @override
  List<Object> get props => [firstName, lastName];
}

class NewJob extends Equatable implements LifeEvent {
  final Job job;

  NewJob(this.job);

  @override
  List<Object> get props => [job];
}

class KickedOutFromParents extends Equatable implements LifeEvent {
  @override
  List<Object> get props => [];
}
