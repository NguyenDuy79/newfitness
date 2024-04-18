import 'package:equatable/equatable.dart';
import 'package:fitness_nutrition/src/core/resource/app_string.dart';

class History with EquatableMixin {
  final String dateTime;
  final List<String> excercise;
  final List<int> set;
  final List<int> restTime;
  final List<int> timeOfSet;
  History(
      {required this.dateTime,
      required this.excercise,
      required this.set,
      required this.restTime,
      required this.timeOfSet});

  Map<String, dynamic> toMap() => {
        AppString.dateTime: dateTime,
        AppString.excercise: excercise,
        AppString.set: set,
        AppString.restTime: restTime,
        AppString.timeOfSet: timeOfSet
      };
  @override
  List<Object?> get props => [dateTime, excercise, set, restTime, timeOfSet];
}
