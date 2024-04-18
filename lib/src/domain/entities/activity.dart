import 'package:equatable/equatable.dart';

class Activity with EquatableMixin {
  final Map<String, Map<String, String>> exercise;
  final Map<int, int> set;
  final Map<int, int> restTime;
  final Map<int, int> restDrop;
  final Map<int, int> setDrop;
  final int time;

  const Activity(
      {required this.exercise,
      required this.set,
      required this.restTime,
      required this.restDrop,
      required this.setDrop,
      required this.time});

  @override
  List<Object?> get props => [exercise, set, restTime, restDrop, setDrop, time];
}
