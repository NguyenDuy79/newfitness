import 'package:equatable/equatable.dart';

import '../../core/resource/app_string.dart';

class Food with EquatableMixin {
  const Food({
    required this.name,
    required this.calories,
    required this.protein,
    required this.carb,
    required this.fat,
  });

  final String name;
  final double calories;
  final double protein;
  final double carb;
  final double fat;
  Map<String, dynamic> toMap() => {
        AppString.name: name,
        AppString.calories: calories,
        AppString.protein: protein,
        AppString.carb: carb,
        AppString.fat: fat
      };

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
        name: json[AppString.name],
        calories: json[AppString.calories],
        protein: json[AppString.protein],
        carb: json[AppString.carb],
        fat: json[AppString.fat]);
  }
  @override
  List<Object?> get props => [
        name,
        calories,
        protein,
        carb,
        fat,
      ];
}
