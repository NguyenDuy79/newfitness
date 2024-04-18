part of 'meal_cubit.dart';

class MealScreenState extends Equatable {
  const MealScreenState(
      {this.listFood = AppAnother.listFood,
      this.listFoodChoosed = const [],
      this.errorText = ''});
  final List<Food> listFood;
  final List<Map<double, Food>> listFoodChoosed;
  final String errorText;

  MealScreenState copyWith(
      {List<Food>? listFood,
      List<Map<double, Food>>? listFoodChoosed,
      String? errorText}) {
    return MealScreenState(
      listFood: listFood ?? this.listFood,
      listFoodChoosed: listFoodChoosed ?? this.listFoodChoosed,
      errorText: errorText ?? this.errorText,
    );
  }

  @override
  List<Object> get props => [
        listFood,
        listFoodChoosed,
        errorText,
      ];
}
