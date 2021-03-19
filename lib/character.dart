import 'package:equatable/equatable.dart';

import 'Work.dart';

enum Housing {
  LivingWithParents,
  Homeless,
}

class Character extends Equatable {
  final String firstName;
  final String lastName;
  final int age;
  final CareerJob currentJob;
  final Housing currentHousing;

  const Character(this.firstName, this.lastName, this.age, this.currentJob, this.currentHousing);

  Character incrementAge() {
    final newAge = this.age + 1;
    final housing = newAge == 25 && currentHousing == Housing.LivingWithParents
        ? Housing.Homeless
        : this.currentHousing;

    return copy(age: newAge, currentHousing: housing);
  }

  Character setCurrentJob(CareerJob careerJob) => copy(currentJob: careerJob);

  Character copy({
    String firstName,
    String lastName,
    int age,
    CareerJob currentJob,
    Housing currentHousing,
  }) =>
      Character(
        firstName ?? this.firstName,
        lastName ?? this.lastName,
        age ?? this.age,
        currentJob ?? this.currentJob,
        currentHousing ?? this.currentHousing,
      );

  @override
  List<Object> get props => [firstName, lastName, age, currentJob, currentHousing];
}
