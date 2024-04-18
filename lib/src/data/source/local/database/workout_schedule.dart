import 'package:fitness_nutrition/src/data/dto/workout_schedule_dto.dart';
import 'package:fitness_nutrition/src/data/source/local/database/database_manager.dart';
import 'package:fitness_nutrition/src/domain/entities/workout_schedule.dart';
import 'package:sembast/sembast.dart';

import '../../../../core/resource/app_string.dart';

class WorkoutScheduleDatabase {
  Stream get storeFactory =>
      _workoutScheduleStore.query().onSnapshots(_openDatabase);
  final _workoutScheduleStore =
      intMapStoreFactory.store(AppString.workoutScheduleTable);

  Database get _openDatabase => DatabaseManager.instance.database;
  Future<void> delete() async => (_openDatabase).close;
  Future<void> insert(Map<String, dynamic> map) async {
    await _workoutScheduleStore.add(_openDatabase, map);
  }

  Future<void> update(Map<String, dynamic> map, int key) async {
    await _workoutScheduleStore.record(key).update(_openDatabase, map);
  }

  Future<void> deleteItem(int key) async {
    await _workoutScheduleStore.record(key).delete(
          _openDatabase,
        );
  }

  Future<List<WorkoutSchedule>> getAllWorkoutSchedule() async {
    final snapshots = await _workoutScheduleStore.find(_openDatabase);
    return snapshots
        .map((infomation) =>
            WorkoutScheduleDto.fromJson(infomation.value, infomation.key))
        .toList();
  }
}
