import 'package:fitness_nutrition/src/domain/entities/infomation.dart';

abstract class InfomationRepository {
  Future<void> addInfomation(Map<String, dynamic> map);
  Future<List<Infomation>> getAllInfomation();
  Stream get status;
}
