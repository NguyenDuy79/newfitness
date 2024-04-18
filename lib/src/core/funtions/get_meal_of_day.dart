import 'package:fitness_nutrition/src/core/funtions/day_of_week.dart';
import 'package:intl/intl.dart';
import '../../domain/entities/meal.dart';

List<Meal> getMealOfDay(List<Meal> listMeal, int choose) {
  List<Meal> newList = [];
  for (int i = 0; i < listMeal.length; i++) {
    if (checkMeal(listMeal[i].dateTime, getWeek(DateTime.now())[choose]) == 0) {
      newList.add(listMeal[i]);
    }
  }
  return newList;
}

int checkMeal(String dateTimeMeal, DateTime dateTime) {
  return dateTime
      .difference(DateTime.parse(
          DateFormat('yyyy-MM-dd').format(DateTime.parse(dateTimeMeal))))
      .inDays;
}
