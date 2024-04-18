import 'package:fitness_nutrition/src/core/use_case/use_case.dart';
import 'package:fitness_nutrition/src/domain/entities/workout_schedule.dart';
import 'package:fitness_nutrition/src/domain/repository/workout_schedule_repo.dart';

class FetchScheduleUseCase implements UserCaseNoParams {
  final WorkoutScheduleRepository _workoutScheduleRepository;
  FetchScheduleUseCase(this._workoutScheduleRepository);

  @override
  Future<List<WorkoutSchedule>> call() async {
    return await _workoutScheduleRepository.getAllWorkoutSchedule();
  }
}
