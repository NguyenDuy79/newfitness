import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:fitness_nutrition/src/domain/usecase/infomation/add_infomation_usecase.dart';
import 'package:fitness_nutrition/src/domain/usecase/infomation/fetch_infomation_usecase.dart';
import 'package:formz/formz.dart';

import '../../../domain/entities/infomation.dart';

part 'infomation_state.dart';

class InfomationCubit extends Cubit<InfomationState> {
  final AddInfomtionUseCase _addInfomtionUseCase;
  final FetchInfomationUseCase _fetchInfomationUseCase;
  StreamSubscription? _streamSubscription;
  InfomationCubit(
      {required AddInfomtionUseCase addInfomtionUseCase,
      required FetchInfomationUseCase fetchInfomationUseCase})
      : _addInfomtionUseCase = addInfomtionUseCase,
        _fetchInfomationUseCase = fetchInfomationUseCase,
        super(const InfomationState([], 0, FormzSubmissionStatus.initial)) {
    _streamSubscription = _addInfomtionUseCase.status.listen((event) async {
      List<Infomation> listData = await _fetchInfomationUseCase.call();

      if (listData.isNotEmpty) {
        emit(InfomationState(listData, 2, state.status));
      } else {
        emit(InfomationState(const [], 1, state.status));
      }
    });
  }
  Future<void> enterInfomation(Map<String, dynamic> map) async {
    emit(InfomationState(
        state.listInfomation, state.check, FormzSubmissionStatus.inProgress));
    try {
      emit(InfomationState(
          state.listInfomation, state.check, FormzSubmissionStatus.success));
      await _addInfomtionUseCase.call(params: map);
    } catch (err) {
      emit(InfomationState(
          state.listInfomation, state.check, FormzSubmissionStatus.failure));
    }
  }

  @override
  Future<void> close() {
    _streamSubscription!.cancel();
    return super.close();
  }
}
