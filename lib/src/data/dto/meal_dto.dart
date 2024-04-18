import '../../core/resource/app_string.dart';
import '../../domain/entities/food.dart';
import '../../domain/entities/meal.dart';

class MealDto extends Meal {
  MealDto({required super.dateTime, required super.foods});
  factory MealDto.fromJson(Map<String, dynamic> json) {
    return MealDto(
        dateTime: json[AppString.dateTime],
        foods: (json[AppString.listFood] as List)
            .map((e) =>
                {double.parse(e.keys.first): Food.fromJson(e.values.first)})
            .toList());
  }
}
