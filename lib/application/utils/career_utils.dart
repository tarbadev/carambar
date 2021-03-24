import '../../domain/work.dart';
import '../../domain/work/job.dart';

String jobInstanceToJobName(Job job) {
  switch(job.runtimeType.toString()) {
    case '_Dishwasher':
      return 'Dishwasher';
    case '_JuniorCook':
      return 'Junior Cook';
    default:
      return null;
  }
}

const Map<CareerFamily, String> careerFamilyToString = {
  CareerFamily.Chef: 'Chef',
};