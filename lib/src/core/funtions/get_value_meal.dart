import '../../domain/entities/food.dart';
import '../../domain/entities/meal.dart';
import '../resource/app_string.dart';

double valueMeal(List<Map<double, Food>> listFood, String label) {
  double result = 0;
  for (int i = 0; i < listFood.length; i++) {
    switch (label) {
      case AppString.calories:
        result = result +
            listFood[i].keys.first * (listFood[i].values.first.calories) / 100;
      case AppString.protein:
        result = result +
            listFood[i].keys.first * (listFood[i].values.first.protein) / 100;
      case AppString.carb:
        result = result +
            listFood[i].keys.first * (listFood[i].values.first.carb) / 100;
      default:
        result = result +
            listFood[i].keys.first * (listFood[i].values.first.fat) / 100;
    }
  }
  return result;
}

double valueMealOfDay(List<Meal> listMeal, String label) {
  double result = 0;

  for (int i = 0; i < listMeal.length; i++) {
    result = result + valueMeal(listMeal[i].foods, label);
  }
  return result;
}
