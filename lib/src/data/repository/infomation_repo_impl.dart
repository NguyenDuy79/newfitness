import 'package:fitness_nutrition/src/data/source/local/database/infomation_database.dart';
import 'package:fitness_nutrition/src/domain/entities/infomation.dart';

import '../../domain/repository/infomation_repo.dart';

class InfomationRepositoryImpl implements InfomationRepository {
  final InfomationDatabase _infomationDatabase;
  InfomationRepositoryImpl(this._infomationDatabase);
  @override
  Future<void> addInfomation(Map<String, dynamic> map) async {
    await _infomationDatabase.insert(map);
  }

  @override
  Future<List<Infomation>> getAllInfomation() async {
    return await _infomationDatabase.getAllInfomation();
  }

  @override
  Stream get status => _infomationDatabase.storeFactory;
}
