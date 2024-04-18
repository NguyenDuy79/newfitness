import 'package:equatable/equatable.dart';
import '../../core/resource/app_string.dart';

class Infomation with EquatableMixin {
  const Infomation(
      {required this.dateTime,
      required this.gender,
      required this.goal,
      required this.bodyFat,
      required this.dateOfBirth,
      required this.height,
      required this.weight,
      required this.dayTraining,
      required this.protein,
      required this.carbs,
      required this.fat});
  final String gender;
  final String goal;
  final String bodyFat;
  final String dateOfBirth;
  final int height;
  final double weight;
  final String dayTraining;
  final int protein;
  final int carbs;
  final int fat;
  final String dateTime;

  Map<String, dynamic> toMap() => {
        AppString.gender: gender,
        AppString.goal: goal,
        AppString.bodyFat: bodyFat,
        AppString.dateOfBirth: dateOfBirth,
        AppString.height: height,
        AppString.weight: weight,
        AppString.dayTraining: dayTraining,
        AppString.protein: protein,
        AppString.fat: fat,
        AppString.carb: carbs,
        AppString.dateTime: dateTime
      };
  @override
  List<Object?> get props => [
        gender,
        goal,
        dateOfBirth,
        bodyFat,
        height,
        weight,
        dayTraining,
        protein,
        carbs,
        fat,
        dateTime
      ];
}
