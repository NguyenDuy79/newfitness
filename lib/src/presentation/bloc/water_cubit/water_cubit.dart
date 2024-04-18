import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fitness_nutrition/src/domain/entities/water.dart';
import 'package:fitness_nutrition/src/domain/usecase/water/add_water_usecase.dart';
import 'package:fitness_nutrition/src/domain/usecase/water/fetch_water_usecase.dart';
import 'package:fitness_nutrition/src/domain/usecase/water/update_water_usecase.dart';
import 'package:formz/formz.dart';

part 'water_state.dart';

class WaterCubit extends Cubit<WaterState> {
  final AddWaterUseCase _addWaterUseCase;
  final FetchWaterUseCase _fetchWaterUseCase;
  final UpdateWaterUseCase _updateWaterUseCase;
  StreamSubscription? _streamSubscription;
  WaterCubit(
      {required AddWaterUseCase addWaterUseCase,
      required FetchWaterUseCase fetchWaterUseCase,
      required UpdateWaterUseCase updateWaterUseCase})
      : _addWaterUseCase = addWaterUseCase,
        _fetchWaterUseCase = fetchWaterUseCase,
        _updateWaterUseCase = updateWaterUseCase,
        super(const WaterState([], FormzSubmissionStatus.initial, 0)) {
    _streamSubscription = _addWaterUseCase.status.listen((event) async {
      List<Water> listData = await _fetchWaterUseCase.call();
      emit(WaterState(listData, state.status, 1));
    });
  }
  Future<void> insertWater(Map<String, dynamic> map) async {
    emit(WaterState(state.allWater, FormzSubmissionStatus.inProgress, 1));
    try {
      await _addWaterUseCase.call(params: map);
      emit(WaterState(state.allWater, FormzSubmissionStatus.success, 1));
    } catch (err) {
      emit(WaterState(state.allWater, FormzSubmissionStatus.failure, 1));
    }
  }

  Future<void> updateWater(Water water) async {
    emit(WaterState(state.allWater, FormzSubmissionStatus.inProgress, 1));
    try {
      emit(WaterState(state.allWater, FormzSubmissionStatus.success, 1));
      await _updateWaterUseCase.call(params: water);
    } catch (err) {
      emit(WaterState(state.allWater, FormzSubmissionStatus.failure, 1));
    }
  }

  @override
  Future<void> close() {
    _streamSubscription!.cancel();
    return super.close();
  }
}
