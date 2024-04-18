import '../entities/water.dart';

abstract class WaterRepository {
  Future<void> addWater(Map<String, dynamic> map);
  Future<List<Water>> getAllWater();
  Future<void> updateWater(int key, Map<String, dynamic> map);
  Stream get status;
}
