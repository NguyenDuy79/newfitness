import 'package:fitness_nutrition/src/data/source/local/database/history_database.dart';
import 'package:fitness_nutrition/src/domain/entities/history.dart';

import '../../domain/repository/history_repo.dart';

class HistoryRepositoryImpl implements HistoryRepository {
  final HistoryDatabase _historyDatabase;
  HistoryRepositoryImpl(this._historyDatabase);

  @override
  Stream get status => _historyDatabase.historyStore;

  @override
  Future<void> addHistory(Map<String, dynamic> map) async {
    _historyDatabase.insert(map);
  }

  @override
  Future<List<History>> getAllHistory() async {
    return await _historyDatabase.getAllHistory();
  }
}
