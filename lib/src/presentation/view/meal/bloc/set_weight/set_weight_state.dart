part of 'set_weight_cubit.dart';

class SetWeightState extends Equatable {
  const SetWeightState(
      {this.errorText = '', this.weight = 100, this.name = ''});
  final String errorText;
  final double weight;
  final String name;

  SetWeightState copyWith({String? errorText, double? weight, String? name}) {
    return SetWeightState(
        name: name ?? this.name,
        errorText: errorText ?? this.errorText,
        weight: weight ?? this.weight);
  }

  @override
  List<Object> get props => [errorText, weight, name];
}
