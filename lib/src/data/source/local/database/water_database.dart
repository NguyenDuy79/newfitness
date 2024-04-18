import 'package:sembast/sembast.dart';

import '../../../../core/resource/app_string.dart';
import '../../../../domain/entities/water.dart';
import '../../../dto/water_dto.dart';
import 'database_manager.dart';

class WaterDatabase {
  final _waterStore = intMapStoreFactory.store(AppString.water);
  Stream get waterStore => _waterStore.query().onSnapshots(_openDatabase);
  Database get _openDatabase => DatabaseManager.instance.database;

  Future<void> insert(Map<String, dynamic> map) async {
    await _waterStore.add(_openDatabase, map);
  }

  Future<void> updateWater(int key, Map<String, dynamic> map) async {
    await _waterStore.record(key).update(_openDatabase, map);
  }

  Future<List<Water>> getAllWater() async {
    final snapshots = await _waterStore.find(_openDatabase);
    return snapshots.map((water) {
      return WaterDto.fromJson(water.key, water.value);
    }).toList();
  }
}
