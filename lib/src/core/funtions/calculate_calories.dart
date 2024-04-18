import '../resource/app_string.dart';

double getCalories(
    String bodyFat, double weight, String dayTraining, String goal) {
  double calories = 0;
  switch (bodyFat) {
    case AppString.bodyFat1:
      calories = 370 + (21.6 * weight * (1 - 0.08));
    case AppString.bodyFat2:
      calories = 370 + (21.6 * weight * (1 - 0.13));
    case AppString.bodyFat3:
      calories = 370 + (21.6 * weight * (1 - 0.19));
    case AppString.bodyFat4:
      calories = 370 + (21.6 * weight * (1 - 0.27));
    case AppString.bodyFat5:
      calories = 370 + (21.6 * weight * (1 - 0.33));
    default:
      calories = 370 + (21.6 * weight * (1 - 0.4));
  }
  switch (dayTraining) {
    case AppString.dayTraining1:
      calories = calories * 1.2;
    case AppString.dayTraining2:
      calories = calories * 1.375;
    case AppString.dayTraining3:
      calories = calories * 1.55;
    case AppString.dayTraining4:
      calories = calories * 1.725;
    default:
      calories = calories * 1.9;
  }

  switch (goal) {
    case AppString.cutting:
      calories = calories - 500;
    case AppString.bulking:
      calories = calories + 500;
    default:
  }

  return calories;
}
