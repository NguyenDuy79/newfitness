part of 'muscle_group_cubit.dart';

class MuscleGroupState extends Equatable {
  const MuscleGroupState(this.muscleGroup);
  final List<String> muscleGroup;
  @override
  List<Object> get props => [muscleGroup];
}
