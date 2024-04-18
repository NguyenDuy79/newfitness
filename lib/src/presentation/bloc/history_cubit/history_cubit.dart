import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fitness_nutrition/src/domain/entities/history.dart';
import 'package:fitness_nutrition/src/domain/usecase/history/add_history_usecase.dart';

import '../../../domain/usecase/history/fetch_history_usecase.dart';

part 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  final AddHistoryUseCase _addHistoryUseCase;
  final FetchHistoryUseCase _fetchHistoryUseCase;
  StreamSubscription? _streamSubscription;
  HistoryCubit(
      {required AddHistoryUseCase addHistoryUseCase,
      required FetchHistoryUseCase fetchHistoryUseCase})
      : _addHistoryUseCase = addHistoryUseCase,
        _fetchHistoryUseCase = fetchHistoryUseCase,
        super(const HistoryState([])) {
    _streamSubscription = _addHistoryUseCase.status.listen((event) async {
      List<History> listData = await _fetchHistoryUseCase.call();

      emit(HistoryState(listData));
    });
  }
  @override
  Future<void> close() {
    _streamSubscription!.cancel();
    return super.close();
  }
}
