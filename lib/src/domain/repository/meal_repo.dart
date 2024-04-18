import 'package:fitness_nutrition/src/domain/entities/meal.dart';

abstract class MealRepository {
  Future<void> addMeal(Map<String, dynamic> map);
  Future<List<Meal>> getAllMeal();
  Stream get status;
}
