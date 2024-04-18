part of 'exericse_cubit.dart';

class ExericseState extends Equatable {
  const ExericseState(this.map, this.hiitLevel, this.hiitCurrentLevel);
  final Map<String, String> map;
  final int hiitLevel;
  final int hiitCurrentLevel;
  @override
  List<Object> get props => [map, hiitLevel, hiitCurrentLevel];
}
