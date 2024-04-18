import 'package:fitness_nutrition/src/core/resource/app_string.dart';
import 'package:fitness_nutrition/src/domain/entities/history.dart';

class HistoryDto extends History {
  HistoryDto(
      {required super.dateTime,
      required super.excercise,
      required super.set,
      required super.restTime,
      required super.timeOfSet});

  factory HistoryDto.fromJson(Map<String, dynamic> json) {
    return HistoryDto(
        dateTime: json[AppString.dateTime],
        excercise: json[AppString.excercise],
        set: json[AppString.set],
        restTime: json[AppString.restTime],
        timeOfSet: json[AppString.timeOfSet]);
  }
}
