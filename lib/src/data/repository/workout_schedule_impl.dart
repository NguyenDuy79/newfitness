import 'package:fitness_nutrition/src/data/source/local/database/workout_schedule.dart';
import 'package:fitness_nutrition/src/domain/entities/workout_schedule.dart';
import 'package:fitness_nutrition/src/domain/repository/workout_schedule_repo.dart';

class WorkoutScheduleRepositoryImpl implements WorkoutScheduleRepository {
  final WorkoutScheduleDatabase _workoutScheduleDatabase;
  WorkoutScheduleRepositoryImpl(this._workoutScheduleDatabase);
  @override
  Future<void> addWorkoutSchedule(Map<String, dynamic> map) async {
    await _workoutScheduleDatabase.insert(map);
  }

  @override
  Future<List<WorkoutSchedule>> getAllWorkoutSchedule() async {
    return await _workoutScheduleDatabase.getAllWorkoutSchedule();
  }

  @override
  Stream get status => _workoutScheduleDatabase.storeFactory;

  @override
  Future<void> updateWorkoutSchedule(Map<String, dynamic> map, int key) async {
    return await _workoutScheduleDatabase.update(map, key);
  }

  @override
  Future<void> delete(int key) async {
    await _workoutScheduleDatabase.deleteItem(key);
  }
}
