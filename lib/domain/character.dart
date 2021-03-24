import 'package:carambar/domain/life_event.dart';
import 'package:carambar/domain/skill.dart';
import 'package:equatable/equatable.dart';

import 'work/job.dart';

enum Housing {
  LivingWithParents,
  Homeless,
}

class Character extends Equatable {
  final String firstName;
  final String lastName;
  final int age;
  final Job currentJob;
  final Housing currentHousing;
  final List<Skill> skills;

  const Character(
    this.firstName,
    this.lastName,
    this.age,
    this.currentJob,
    this.currentHousing,
    this.skills,
  );

  Character incrementAge() {
    final newAge = this.age + 1;
    final housing = newAge == 25 && currentHousing == Housing.LivingWithParents
        ? Housing.Homeless
        : this.currentHousing;

    List<Skill> newSkills = List.from(skills);
    if (currentJob != null) {
      currentJob.developedSkills.forEach((developedSkill) {
        int index = newSkills.indexWhere((element) => element.skill == developedSkill.skill);
        Skill skill = (index >= 0 ? newSkills[index] : Skill(developedSkill.skill))
            .makeProgress(developedSkill.learningLevel);

        if (index >= 0) {
          newSkills[index] = skill;
        } else {
          newSkills.add(skill);
        }
      });
    }

    return copy(age: newAge, currentHousing: housing, skills: newSkills);
  }

  Character setCurrentJob(Job careerJob) => copy(currentJob: careerJob);

  Character copy({
    String firstName,
    String lastName,
    int age,
    Job currentJob,
    Housing currentHousing,
    List<Skill> skills,
  }) =>
      Character(
        firstName ?? this.firstName,
        lastName ?? this.lastName,
        age ?? this.age,
        currentJob ?? this.currentJob,
        currentHousing ?? this.currentHousing,
        skills ?? this.skills,
      );

  @override
  List<Object> get props => [firstName, lastName, age, currentJob, currentHousing, skills];

  factory Character.fromInitiateEvent(InitiateEvent initiateEvent) {
    return Character(
      initiateEvent.firstName,
      initiateEvent.lastName,
      18,
      null,
      Housing.LivingWithParents,
      [],
    );
  }
}
