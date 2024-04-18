part of 'schedule_cubit.dart';

class ScheduleState extends Equatable {
  const ScheduleState(this.allWorkoutSchedulel, this.status, this.check);
  final List<WorkoutSchedule> allWorkoutSchedulel;
  final FormzSubmissionStatus status;
  final int check;
  @override
  List<Object> get props => [allWorkoutSchedulel, status, check];
}
