class Character {
  final String firstName;
  final String lastName;
  final int age;

  Character({this.firstName, this.lastName, this.age});

  Character incrementAge() {
    return Character(
      firstName: this.firstName,
      lastName: this.lastName,
      age: this.age + 1,
    );
  }
}
