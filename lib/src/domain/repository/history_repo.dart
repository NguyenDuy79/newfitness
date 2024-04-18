import 'package:fitness_nutrition/src/domain/entities/history.dart';

abstract class HistoryRepository {
  Future<void> addHistory(Map<String, dynamic> map);
  Future<List<History>> getAllHistory();
  Stream get status;
}
