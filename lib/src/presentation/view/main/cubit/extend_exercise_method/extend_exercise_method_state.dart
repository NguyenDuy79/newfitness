part of 'extend_exercise_method_cubit.dart';

class ExtendExerciseMethodState with EquatableMixin {
  ExtendExerciseMethodState(this.listIndex);
  final List<int> listIndex;
  @override
  List<Object?> get props => [listIndex];
}
