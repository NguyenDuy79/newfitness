part of 'timer_cubit.dart';

class TimerState extends Equatable {
  const TimerState(this.duration, this.durationBegin);
  final int duration;
  final int durationBegin;
  @override
  List<Object> get props => [duration, durationBegin];
}
