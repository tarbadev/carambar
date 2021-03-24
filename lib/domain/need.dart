import 'package:equatable/equatable.dart';

import 'need_type.dart';

class Need extends Equatable {
  final NeedType need;
  final double fulfillment;

  Need(this.need, this.fulfillment);

  @override
  List<Object> get props => [need, fulfillment];
}