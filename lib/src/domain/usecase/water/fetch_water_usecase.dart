import 'package:fitness_nutrition/src/core/use_case/use_case.dart';
import 'package:fitness_nutrition/src/domain/entities/water.dart';
import 'package:fitness_nutrition/src/domain/repository/water_repo.dart';

class FetchWaterUseCase implements UserCaseNoParams {
  final WaterRepository _waterRepository;
  FetchWaterUseCase(this._waterRepository);

  @override
  Future<List<Water>> call() async {
    return await _waterRepository.getAllWater();
  }
}
