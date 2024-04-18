part of 'water_cubit.dart';

class WaterState extends Equatable {
  const WaterState(this.allWater, this.status, this.check);
  final List<Water> allWater;
  final FormzSubmissionStatus status;
  final int check;
  @override
  List<Object> get props => [allWater, status, check];
}
