import 'package:carambar/career_utils.dart';
import 'package:carambar/character_provider.dart';
import 'package:carambar/domain/life_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'character_life_provider.dart';
import 'domain/age_event.dart';

class HomeTab extends ConsumerWidget {
  HomeTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final ageEvents = watch(characterLifeProvider.state).ageEvents;

    return Scaffold(
      body: _displayAgeEvents(ageEvents),
      bottomNavigationBar: MaterialButton(
        key: Key('Home__Plus1YearButton'),
        color: Colors.lightBlue,
        child: Text(
          '+1 year',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: context.read(characterProvider).age,
      ),
    );
  }

  ListView _displayAgeEvents(List<AgeEvent> ageEvents) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: 10),
      itemCount: ageEvents.length,
      separatorBuilder: (context, index) => Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Divider(color: Colors.grey, height: 2),
      ),
      itemBuilder: (BuildContext context, int index) {
        final ageEvent = ageEvents[index];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          key: Key('LifeEventItem__${ageEvent.age}'),
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Age ${ageEvent.age}',
                textScaleFactor: 1.2,
                key: Key('LifeEventItem__${ageEvent.age}__Title'),
              ),
            ),
            ...ageEvent.lifeEvents.asMap().entries.map((entry) => LifeEventCard(
                  lifeEvent: entry.value,
                  eventKey: Key('LifeEventItem__${ageEvent.age}__Event__${entry.key}'),
                )),
          ],
        );
      },
      key: Key('AgeEvents'),
    );
  }
}

class LifeEventCard extends StatelessWidget {
  final LifeEvent lifeEvent;
  final Key eventKey;

  const LifeEventCard({Key key, this.lifeEvent, this.eventKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2),
      child: Card(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Text(
            _lifeEventToString(lifeEvent),
            key: eventKey,
          ),
        ),
      ),
    );
  }
}

String _lifeEventToString(LifeEvent lifeEvent) {
  switch (lifeEvent.runtimeType) {
    case InitiateEvent:
      final initiateEvent = lifeEvent as InitiateEvent;
      return '''
      Your life just started!
      Your name is ${initiateEvent.firstName} ${initiateEvent.lastName}
      '''
          .split('\n')
          .map((line) => line.trim())
          .reduce((line1, line2) => line2.isNotEmpty ? '$line1\n$line2' : line1);
      break;
    case NewJob:
      final newJobName = (lifeEvent as NewJob).job;
      return 'You just started a new job as ${careerJobToString(newJobName)}';
      break;
    case KickedOutFromParents:
      return 'You got kicked out of the house by your parents! You\'re now homeless';
      break;
    default:
      throw LifeEventTypeNotKnownException(lifeEvent.runtimeType);
  }
}
