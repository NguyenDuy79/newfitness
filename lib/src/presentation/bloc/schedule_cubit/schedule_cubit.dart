import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fitness_nutrition/src/domain/usecase/workout_schedule/add_schedule_usecase.dart';
import 'package:fitness_nutrition/src/domain/usecase/workout_schedule/delete_schedule_usecase.dart';
import 'package:fitness_nutrition/src/domain/usecase/workout_schedule/fetch_schedule_usecase.dart';
import 'package:fitness_nutrition/src/domain/usecase/workout_schedule/update_schedule_usecase.dart';
import 'package:formz/formz.dart';

import '../../../domain/entities/workout_schedule.dart';

part 'schedule_state.dart';

class ScheduleCubit extends Cubit<ScheduleState> {
  final AddScheduleUseCase _addScheduleUseCase;
  final FetchScheduleUseCase _fetchScheduleUseCase;
  final UpdateWorkoutScheduleUseCase _updateWorkoutScheduleUseCase;
  final DeleteScheduleUseCase _deleteScheduleUseCase;
  StreamSubscription? _streamSubscription;
  ScheduleCubit(
      {required AddScheduleUseCase addScheduleUseCase,
      required FetchScheduleUseCase fetchScheduleUseCase,
      required UpdateWorkoutScheduleUseCase updateWorkoutScheduleUseCase,
      required DeleteScheduleUseCase deleteScheduleUseCase})
      : _addScheduleUseCase = addScheduleUseCase,
        _fetchScheduleUseCase = fetchScheduleUseCase,
        _updateWorkoutScheduleUseCase = updateWorkoutScheduleUseCase,
        _deleteScheduleUseCase = deleteScheduleUseCase,
        super(const ScheduleState([], FormzSubmissionStatus.initial, 0)) {
    _streamSubscription = _addScheduleUseCase.status.listen((event) async {
      List<WorkoutSchedule> listData = await _fetchScheduleUseCase.call();
      emit(ScheduleState(listData, FormzSubmissionStatus.initial, 1));
    });
  }
  Future<void> addSchedule(Map<String, dynamic> map) async {
    progressStatus();
    try {
      successStatus();
      await _addScheduleUseCase.call(params: map);
    } catch (err) {
      failureStatus();
    }
  }

  void progressStatus() {
    emit(ScheduleState(
        state.allWorkoutSchedulel, FormzSubmissionStatus.inProgress, 1));
  }

  void failureStatus() {
    emit(ScheduleState(
        state.allWorkoutSchedulel, FormzSubmissionStatus.failure, 1));
  }

  void successStatus() {
    emit(ScheduleState(
        state.allWorkoutSchedulel, FormzSubmissionStatus.success, 1));
  }

  Future<void> deleteSchedule(int key) async {
    progressStatus();
    try {
      successStatus();
      await _deleteScheduleUseCase.call(params: key);
    } catch (err) {
      failureStatus();
    }
  }

  Future<void> updateAll() async {
    progressStatus();
    try {
      successStatus();
      for (WorkoutSchedule item in state.allWorkoutSchedulel) {
        item = WorkoutSchedule(
            dateTime: item.dateTime,
            key: item.key,
            name: item.name,
            check: false,
            mon: item.mon,
            tue: item.tue,
            wed: item.wed,
            thu: item.thu,
            fri: item.fri,
            sat: item.sat,
            sun: item.sun);

        _updateWorkoutScheduleUseCase.call(params: item);
      }
    } catch (err) {
      failureStatus();
    }
  }

  Future<void> updateItemSubmit(
    WorkoutSchedule workoutSchedule1,
  ) async {
    WorkoutSchedule workoutScheduleNew1 = WorkoutSchedule(
        dateTime: workoutSchedule1.dateTime,
        key: workoutSchedule1.key,
        name: workoutSchedule1.name,
        check: !workoutSchedule1.check,
        mon: workoutSchedule1.mon,
        tue: workoutSchedule1.tue,
        wed: workoutSchedule1.wed,
        thu: workoutSchedule1.thu,
        fri: workoutSchedule1.fri,
        sat: workoutSchedule1.sat,
        sun: workoutSchedule1.sun);
    progressStatus();
    try {
      successStatus();
      _updateWorkoutScheduleUseCase.call(params: workoutScheduleNew1);
    } catch (err) {
      failureStatus();
    }
  }

  @override
  Future<void> close() {
    _streamSubscription!.cancel();
    return super.close();
  }
}
