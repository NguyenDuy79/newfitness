import 'package:fitness_nutrition/src/core/use_case/use_case.dart';
import 'package:fitness_nutrition/src/data/source/local/database/workout_schedule.dart';

class DeleteScheduleUseCase implements UseCase<void, int> {
  DeleteScheduleUseCase(this._workoutScheduleDatabase);
  final WorkoutScheduleDatabase _workoutScheduleDatabase;
  @override
  Future<void> call({required int params}) async {
    await _workoutScheduleDatabase.deleteItem(params);
  }

  @override
  Stream get status => throw UnimplementedError();
}
