import 'package:equatable/equatable.dart';

import 'Work.dart';

class Character extends Equatable {
  final String firstName;
  final String lastName;
  final int age;
  final CareerJob currentJob;

  const Character({this.firstName, this.lastName, this.age, this.currentJob});

  Character incrementAge() {
    return Character(
      firstName: this.firstName,
      lastName: this.lastName,
      age: this.age + 1,
      currentJob: this.currentJob,
    );
  }

  Character setCurrentJob(CareerJob careerJob) {
    return Character(
      firstName: this.firstName,
      lastName: this.lastName,
      age: this.age,
      currentJob: careerJob,
    );
  }

  @override
  List<Object> get props => [firstName, lastName, age, currentJob];
}
