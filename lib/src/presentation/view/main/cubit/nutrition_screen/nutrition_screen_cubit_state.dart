part of 'nutrition_screen_cubit_cubit.dart';

class NutritionScreenCubitState extends Equatable {
  const NutritionScreenCubitState(
      {this.choose = 0, this.calories = true, this.water = 100});
  final int choose;
  final bool calories;
  final int water;

  NutritionScreenCubitState copyWith(
      {int? choose, bool? calories, int? water}) {
    return NutritionScreenCubitState(
        choose: choose ?? this.choose,
        water: water ?? this.water,
        calories: calories ?? this.calories);
  }

  @override
  List<Object> get props => [choose, calories, water];
}
