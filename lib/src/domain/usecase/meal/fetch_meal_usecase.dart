import 'package:fitness_nutrition/src/core/use_case/use_case.dart';
import 'package:fitness_nutrition/src/domain/entities/meal.dart';
import 'package:fitness_nutrition/src/domain/repository/meal_repo.dart';

class FetchMealUseCase implements UserCaseNoParams {
  final MealRepository _mealRepository;
  FetchMealUseCase(this._mealRepository);
  @override
  Future<List<Meal>> call() async {
    return await _mealRepository.getAllMeal();
  }
}
