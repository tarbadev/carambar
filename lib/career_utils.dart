import 'domain/work.dart';
import 'domain/work/job.dart';

String careerJobToString(Job job) {
  switch(job.runtimeType) {
    case Dishwasher:
      return 'Dishwasher';
    default:
      throw new CareerJobNotListedException(job.runtimeType);
  }
}

const Map<CareerFamily, String> careerFamilyToString = {
  CareerFamily.Chef: 'Chef',
};

class CareerJobNotListedException implements Exception {
  final unknownType;

  CareerJobNotListedException(this.unknownType);

  String toString() {
    if (unknownType == null) return "CareerJobNotListedException";
    return "CareerJobNotListedException: Unknown type ($unknownType)";
  }
}