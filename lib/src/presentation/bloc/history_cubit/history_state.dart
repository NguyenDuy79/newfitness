part of 'history_cubit.dart';

class HistoryState extends Equatable {
  const HistoryState(this.allHistory);
  final List<History> allHistory;
  @override
  List<Object> get props => [allHistory];
}
