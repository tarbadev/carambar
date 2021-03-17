import 'package:equatable/equatable.dart';

class Character extends Equatable {
  final String firstName;
  final String lastName;
  final int age;

  const Character({this.firstName, this.lastName, this.age});

  Character incrementAge() {
    return Character(
      firstName: this.firstName,
      lastName: this.lastName,
      age: this.age + 1,
    );
  }

  @override
  List<Object> get props => [firstName, lastName, age];
}
