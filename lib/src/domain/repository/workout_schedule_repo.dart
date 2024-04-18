import 'dart:async';

import 'package:fitness_nutrition/src/domain/entities/workout_schedule.dart';

abstract class WorkoutScheduleRepository {
  Future<void> addWorkoutSchedule(Map<String, dynamic> map);
  Future<List<WorkoutSchedule>> getAllWorkoutSchedule();
  Future<void> updateWorkoutSchedule(Map<String, dynamic> map, int key);
  Future<void> delete(int key);
  Stream get status;
}
