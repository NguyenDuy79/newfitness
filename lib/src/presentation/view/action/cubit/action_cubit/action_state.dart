part of 'action_cubit.dart';

class ActionState extends Equatable {
  const ActionState(
      {this.indexExercise = 0,
      this.indexSet = 0,
      this.indexSetDrop = 0,
      this.indexPage = 0});
  final int indexExercise;
  final int indexSet;
  final int indexSetDrop;
  final int indexPage;
  ActionState copyWith(
      {int? indexExercise, int? indexSet, int? indexSetDrop, int? indexPage}) {
    return ActionState(
        indexExercise: indexExercise ?? this.indexExercise,
        indexSet: indexSet ?? this.indexSet,
        indexSetDrop: indexSetDrop ?? this.indexSetDrop,
        indexPage: indexPage ?? this.indexPage);
  }

  @override
  List<Object> get props => [indexExercise, indexSet, indexSetDrop, indexPage];
}
