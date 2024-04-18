import 'package:fitness_nutrition/src/core/use_case/use_case.dart';

import 'package:fitness_nutrition/src/domain/repository/workout_schedule_repo.dart';

class AddScheduleUseCase implements UseCase<void, Map<String, dynamic>> {
  final WorkoutScheduleRepository _workoutScheduleRepository;
  AddScheduleUseCase(this._workoutScheduleRepository);
  @override
  Future call({required params}) async {
    await _workoutScheduleRepository.addWorkoutSchedule(params);
  }

  @override
  Stream get status => _workoutScheduleRepository.status;
}
