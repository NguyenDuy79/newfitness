import 'package:fitness_nutrition/src/domain/entities/workout_schedule.dart';
import 'package:fitness_nutrition/src/presentation/view/schedule/cubit/schedule_screen_cubit/schedule_screen_cubit.dart';

import '../resource/app_string.dart';

List<Map<String, Map<String, String>>> getListMethod(
    ScheduleScreenMainState state) {
  switch (state.allDay[state.countDay]) {
    case AppString.monday:
      return state.mon;
    case AppString.tuesday:
      return state.tue;
    case AppString.wednesday:
      return state.wed;
    case AppString.thursday:
      return state.thu;
    case AppString.friday:
      return state.fri;
    case AppString.saturday:
      return state.sat;
    default:
      return state.sun;
  }
}

List<Map<String, Map<String, String>>> getList(
    List<WorkoutSchedule> workoutSchedule, int index) {
  List<Map<String, Map<String, String>>> result = [];

  for (WorkoutSchedule item in workoutSchedule) {
    if (item.check) {
      switch (index) {
        case 0:
          result = item.mon;
        case 1:
          result = item.tue;
        case 2:
          result = item.wed;
        case 3:
          result = item.thu;
        case 4:
          result = item.fri;
        case 5:
          result = item.sat;
        default:
          result = item.sun;
      }
    }
  }

  return result;
}

List<Map<String, Map<String, String>>> getListDetail(
    WorkoutSchedule workoutSchedule, String day) {
  List<Map<String, Map<String, String>>> result = [];

  switch (day) {
    case AppString.monday:
      result = workoutSchedule.mon;
    case AppString.tuesday:
      result = workoutSchedule.tue;
    case AppString.wednesday:
      result = workoutSchedule.wed;
    case AppString.thursday:
      result = workoutSchedule.thu;
    case AppString.friday:
      result = workoutSchedule.fri;
    case AppString.saturday:
      result = workoutSchedule.sat;
    default:
      result = workoutSchedule.sun;
  }

  return result;
}

List<Map<String, Map<String, String>>> resetListMethod(
    List<Map<String, Map<String, String>>> map) {
  List<Map<String, Map<String, String>>> newList = [];
  for (Map<String, Map<String, String>> item in map) {
    newList.add({item.keys.first: {}});
  }
  return newList;
}
