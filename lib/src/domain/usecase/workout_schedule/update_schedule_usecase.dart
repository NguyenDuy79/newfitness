import 'package:fitness_nutrition/src/core/use_case/use_case.dart';
import 'package:fitness_nutrition/src/domain/entities/workout_schedule.dart';
import 'package:fitness_nutrition/src/domain/repository/workout_schedule_repo.dart';

class UpdateWorkoutScheduleUseCase implements UseCase<void, WorkoutSchedule> {
  final WorkoutScheduleRepository _workoutScheduleRepository;
  UpdateWorkoutScheduleUseCase(this._workoutScheduleRepository);
  @override
  Future<void> call({required params}) async {
    await _workoutScheduleRepository.updateWorkoutSchedule(
        params.toMap(), params.key);
  }

  @override
  Stream get status => throw UnimplementedError();
}
