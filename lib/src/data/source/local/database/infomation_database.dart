import 'package:fitness_nutrition/src/data/source/local/database/database_manager.dart';
import 'package:sembast/sembast.dart';

import '../../../../core/resource/app_string.dart';
import '../../../../domain/entities/infomation.dart';
import '../../../dto/infomation_dto.dart';

class InfomationDatabase {
  Stream get storeFactory =>
      _infomationStore.query().onSnapshots(_openDatabase);
  final _infomationStore = intMapStoreFactory.store(AppString.infomationTable);

  Database get _openDatabase => DatabaseManager.instance.database;
  Future<void> delete() async => (_openDatabase).close;
  Future<void> insert(Map<String, dynamic> map) async {
    await _infomationStore.add(_openDatabase, map);
  }

  Future<List<Infomation>> getAllInfomation() async {
    final snapshots = await _infomationStore.find(_openDatabase);
    return snapshots
        .map((infomation) => InfomationDto.fromJson(infomation.value))
        .toList();
  }
}
