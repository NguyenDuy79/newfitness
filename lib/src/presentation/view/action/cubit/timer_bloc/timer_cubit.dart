import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:fitness_nutrition/src/presentation/view/action/widget/ticker.dart';

part 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  final Ticker _ticker;
  StreamSubscription? _subscription;
  TimerCubit({required Ticker ticker})
      : _ticker = ticker,
        super(const TimerState(0, 0));
  void startedRestTime(int duration) {
    _subscription?.cancel();
    emit(TimerState(duration, duration));
    _subscription = _ticker.tickRestTime(ticks: duration).listen((even) {
      emit(TimerState(even, state.durationBegin));
    });
  }

  void startSet(int duration) {
    _subscription?.cancel();
    emit(TimerState(duration, duration));

    _subscription = _ticker.tickSet(ticks: duration).listen((event) {
      emit(TimerState(event, state.durationBegin));
    });
  }

  void completed() {
    _subscription?.cancel();
    emit(const TimerState(0, 0));
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
