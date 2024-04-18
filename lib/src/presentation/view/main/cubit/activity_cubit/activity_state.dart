part of 'activity_cubit.dart';

class ActivityState extends Equatable {
  const ActivityState(
      {this.exercise = const {},
      this.methodExercise = '',
      this.exerciseDrop = '',
      this.exerciseSuper = const [],
      this.sortData = const [],
      this.restDrop = const {},
      this.set = const {},
      this.restTime = const {},
      this.setDrop = const {},
      this.time = 0});
  final Map<String, Map<String, String>> exercise;
  final String exerciseDrop;
  final String methodExercise;
  final List<String> exerciseSuper;
  final List<String> sortData;
  final Map<int, int> restTime;
  final Map<int, int> set;
  final Map<int, int> setDrop;
  final Map<int, int> restDrop;
  final int time;
  ActivityState copyWith(
      {Map<String, Map<String, String>>? exercise,
      int? index,
      String? exerciseDrop,
      String? methodExercise,
      List<String>? exerciseSuper,
      List<String>? sortData,
      Map<int, int>? restTime,
      Map<int, int>? set,
      Map<int, int>? setDrop,
      Map<int, int>? restDrop,
      int? time}) {
    return ActivityState(
        exerciseDrop: exerciseDrop ?? this.exerciseDrop,
        exercise: exercise ?? this.exercise,
        methodExercise: methodExercise ?? this.methodExercise,
        exerciseSuper: exerciseSuper ?? this.exerciseSuper,
        sortData: sortData ?? this.sortData,
        restTime: restTime ?? this.restTime,
        set: set ?? this.set,
        time: time ?? this.time,
        restDrop: restDrop ?? this.restDrop,
        setDrop: setDrop ?? this.setDrop);
  }

  @override
  List<Object> get props => [
        exercise,
        methodExercise,
        exerciseDrop,
        exerciseSuper,
        sortData,
        restTime,
        set,
        setDrop,
        restDrop,
        time
      ];
}
