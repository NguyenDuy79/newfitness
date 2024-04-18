import 'package:equatable/equatable.dart';
import 'package:fitness_nutrition/src/core/resource/app_string.dart';

class WorkoutSchedule with EquatableMixin {
  WorkoutSchedule(
      {required this.dateTime,
      required this.key,
      required this.name,
      required this.check,
      required this.mon,
      required this.tue,
      required this.wed,
      required this.thu,
      required this.fri,
      required this.sat,
      required this.sun});
  final String dateTime;
  final int key;
  final bool check;
  final String name;
  final List<Map<String, Map<String, String>>> mon;
  final List<Map<String, Map<String, String>>> tue;
  final List<Map<String, Map<String, String>>> wed;
  final List<Map<String, Map<String, String>>> thu;
  final List<Map<String, Map<String, String>>> fri;
  final List<Map<String, Map<String, String>>> sat;
  final List<Map<String, Map<String, String>>> sun;
  Map<String, dynamic> toMap() => {
        AppString.dateTime: dateTime,
        AppString.name: name,
        'check': check,
        AppString.mon: mon,
        AppString.tue: tue,
        AppString.wed: wed,
        AppString.thu: thu,
        AppString.fri: fri,
        AppString.sat: sat,
        AppString.sun: sun
      };

  @override
  List<Object?> get props =>
      [dateTime, check, mon, tue, wed, thu, fri, sat, sun, name, key];
}
