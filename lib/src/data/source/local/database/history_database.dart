import 'package:fitness_nutrition/src/data/dto/history_dto.dart';
import 'package:fitness_nutrition/src/domain/entities/history.dart';
import 'package:sembast/sembast.dart';

import '../../../../core/resource/app_string.dart';
import 'database_manager.dart';

class HistoryDatabase {
  final _historyStore = intMapStoreFactory.store(AppString.historyTable);
  Stream get historyStore => _historyStore.query().onSnapshots(_openDatabase);
  Database get _openDatabase => DatabaseManager.instance.database;
  Future delete() async => _openDatabase.close;
  Future<void> insert(Map<String, dynamic> map) async {
    await _historyStore.add(_openDatabase, map);
  }

  Future<List<History>> getAllHistory() async {
    final snapshots = await _historyStore.find(_openDatabase);
    return snapshots
        .map((history) => HistoryDto.fromJson(history.value))
        .toList();
  }
}
