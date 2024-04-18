import '../../core/resource/app_string.dart';
import '../../domain/entities/infomation.dart';

class InfomationDto extends Infomation {
  InfomationDto({
    required super.gender,
    required super.goal,
    required super.bodyFat,
    required super.dateOfBirth,
    required super.height,
    required super.weight,
    required super.dayTraining,
    required super.protein,
    required super.carbs,
    required super.fat,
    required super.dateTime,
  });

  factory InfomationDto.fromJson(Map<String, dynamic> json) {
    return InfomationDto(
        dateTime: json[AppString.dateTime],
        gender: json[AppString.gender] as String,
        goal: json[AppString.goal] as String,
        bodyFat: json[AppString.bodyFat] as String,
        dateOfBirth: json[AppString.dateOfBirth] as String,
        height: json[AppString.height] as int,
        weight: json[AppString.weight] as double,
        dayTraining: json[AppString.dayTraining] as String,
        protein: json[AppString.protein],
        carbs: json[AppString.carb],
        fat: json[AppString.fat]);
  }
}
