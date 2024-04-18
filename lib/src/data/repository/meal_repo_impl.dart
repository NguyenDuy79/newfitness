import 'package:fitness_nutrition/src/data/source/local/database/meal_database.dart';
import 'package:fitness_nutrition/src/domain/entities/meal.dart';
import 'package:fitness_nutrition/src/domain/repository/meal_repo.dart';

class MealRepositoryImpl implements MealRepository {
  final MealDatabase _mealDatabase;
  MealRepositoryImpl(this._mealDatabase);
  @override
  Future<void> addMeal(Map<String, dynamic> map) async {
    await _mealDatabase.insert(map);
  }

  @override
  Future<List<Meal>> getAllMeal() async {
    return await _mealDatabase.getAllMeal();
  }

  @override
  Stream get status => _mealDatabase.storeFactory;
}
