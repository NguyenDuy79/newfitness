import 'package:fitness_nutrition/src/core/use_case/use_case.dart';
import 'package:fitness_nutrition/src/domain/repository/meal_repo.dart';

class AddMealUseCase implements UseCase<void, Map<String, dynamic>> {
  final MealRepository _mealRepository;
  AddMealUseCase(this._mealRepository);
  @override
  Future call({required params}) async {
    await _mealRepository.addMeal(params);
  }

  @override
  Stream get status => _mealRepository.status;
}
