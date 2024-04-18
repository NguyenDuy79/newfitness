import 'package:fitness_nutrition/src/data/source/local/database/water_database.dart';
import 'package:fitness_nutrition/src/domain/entities/water.dart';
import 'package:fitness_nutrition/src/domain/repository/water_repo.dart';

class WaterRepositoryImpl implements WaterRepository {
  final WaterDatabase _waterDatabase;
  WaterRepositoryImpl(this._waterDatabase);
  @override
  Future<void> addWater(Map<String, dynamic> map) async {
    await _waterDatabase.insert(map);
  }

  @override
  Future<List<Water>> getAllWater() async {
    return await _waterDatabase.getAllWater();
  }

  @override
  Stream get status => _waterDatabase.waterStore;

  @override
  Future<void> updateWater(int key, Map<String, dynamic> map) async {
    await _waterDatabase.updateWater(key, map);
  }
}
