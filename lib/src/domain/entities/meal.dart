import 'package:equatable/equatable.dart';
import 'package:fitness_nutrition/src/domain/entities/food.dart';

import '../../core/resource/app_string.dart';

class Meal with EquatableMixin {
  const Meal({required this.dateTime, required this.foods});
  final String dateTime;
  final List<Map<double, Food>> foods;
  Map<String, dynamic> toMap() => {
        AppString.dateTime: dateTime,
        AppString.listFood: foods
            .map((food) =>
                {food.keys.first.toString(): food.values.first.toMap()})
            .toList()
      };
  // final value = foods
  //       .map((food) =>
  //           {food.keys.first.toString(): food.values.first.toMap()})
  //       .toList()
  @override
  List<Object?> get props => [dateTime, foods];
}
