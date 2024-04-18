part of 'detail_schedule_cubit.dart';

class DetailScheduleState extends Equatable {
  const DetailScheduleState(this.listDay, this.listIndex);
  final List<String> listDay;
  final List<List<int>> listIndex;

  @override
  List<Object> get props => [listDay, listIndex];
}
