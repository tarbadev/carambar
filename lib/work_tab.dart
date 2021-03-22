import 'package:carambar/domain/work.dart';
import 'package:carambar/career_utils.dart';
import 'package:carambar/character_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WorkTab extends ConsumerWidget {
  WorkTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final currentJob = watch(characterProvider.state)?.currentJob;

    return Container(
      key: Key('Work'),
      child: ListView.separated(
        separatorBuilder: (context, index) => Divider(color: Colors.grey, height: 2),
        key: Key('Work__AvailableJobs'),
        itemCount: allJobs.length,
        itemBuilder: (BuildContext context, int index) {
          final job = allJobs[index];
          final jobName = careerJobToString(allJobs[index]);

          return ListTile(
            key: Key('Work__Job__$jobName'),
            title: Text(jobName),
            onTap: () => context.read(characterProvider).setJob(job),
            enabled: currentJob != job,
          );
        },
      ),
    );
  }
}
