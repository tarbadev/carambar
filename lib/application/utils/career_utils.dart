import '../../domain/work.dart';
import '../../domain/work/job.dart';

String jobInstanceToJobName(Job job) {
  switch(job.runtimeType.toString()) {
    case '_Dishwasher':
      return 'Dishwasher';
    case '_JuniorCook':
      return 'Junior Cook';
    case '_LineCook':
      return 'Line Cook';
    case '_SectionCook':
      return 'Section Cook';
    case '_SousChef':
      return 'Sous-Chef';
    case '_Chef':
      return 'Chef';
    case '_StarredChef':
      return 'Starred Chef';
    default:
      return null;
  }
}

const Map<CareerFamily, String> careerFamilyToString = {
  CareerFamily.Chef: 'Chef',
};