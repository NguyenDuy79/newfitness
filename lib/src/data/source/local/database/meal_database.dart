import 'package:fitness_nutrition/src/data/dto/meal_dto.dart';
import 'package:fitness_nutrition/src/data/source/local/database/database_manager.dart';
import 'package:fitness_nutrition/src/domain/entities/meal.dart';
import 'package:sembast/sembast.dart';

import '../../../../core/resource/app_string.dart';

class MealDatabase {
  Stream get storeFactory => _mealStore.query().onSnapshot(_openDatabase);
  final _mealStore = intMapStoreFactory.store(AppString.mealTable);

  Database get _openDatabase => DatabaseManager.instance.database;
  Future<void> delete() async => (_openDatabase).close;
  Future<void> insert(Map<String, dynamic> map) async {
    await _mealStore.add(_openDatabase, map);
  }

  Future<List<Meal>> getAllMeal() async {
    final snapshots = await _mealStore.find(_openDatabase);
    return snapshots
        .map((infomation) => MealDto.fromJson(infomation.value))
        .toList();
  }
}
