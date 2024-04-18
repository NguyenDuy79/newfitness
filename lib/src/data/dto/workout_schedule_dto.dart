import 'package:fitness_nutrition/src/core/resource/app_string.dart';
import 'package:fitness_nutrition/src/domain/entities/workout_schedule.dart';

class WorkoutScheduleDto extends WorkoutSchedule {
  WorkoutScheduleDto(
      {required super.dateTime,
      required super.mon,
      required super.tue,
      required super.wed,
      required super.thu,
      required super.fri,
      required super.sat,
      required super.sun,
      required super.name,
      required super.key,
      required super.check});
  factory WorkoutScheduleDto.fromJson(Map<String, dynamic> json, int key) {
    return WorkoutScheduleDto(
        key: key,
        check: json['check'],
        dateTime: json[AppString.dateTime],
        name: json[AppString.name],
        mon: listMap(json, AppString.mon),
        tue: listMap(json, AppString.tue),
        wed: listMap(json, AppString.wed),
        thu: listMap(json, AppString.thu),
        fri: listMap(json, AppString.fri),
        sat: listMap(json, AppString.sat),
        sun: listMap(json, AppString.sun));
  }
}

List<Map<String, Map<String, String>>> listMap(
    Map<String, dynamic> map, String day) {
  List<Map<String, Map<String, String>>> result = [];
  for (int i = 0; i < (map[day] as List).length; i++) {
    Map<String, Map<String, String>> newMap = {};
    Map<String, String> exerciseMap = {};
    for (int j = 0;
        j < ((map[day][i] as Map).values.first as Map).length;
        j++) {
      exerciseMap.addAll({
        ((map[day][i] as Map).values.first as Map).keys.toList()[j]:
            ((map[day][i] as Map).values.first as Map).values.toList()[j]
      });
    }
    newMap.addAll({(map[day][i] as Map).keys.first: exerciseMap});
    result.add(newMap);
  }
  return result;
}
