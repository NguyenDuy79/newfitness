import 'package:fitness_nutrition/src/core/use_case/use_case.dart';
import 'package:fitness_nutrition/src/domain/entities/water.dart';
import 'package:fitness_nutrition/src/domain/repository/water_repo.dart';

class UpdateWaterUseCase implements UseCase<void, Water> {
  final WaterRepository _waterRepository;
  UpdateWaterUseCase(this._waterRepository);
  @override
  Future<void> call({required Water params}) async {
    await _waterRepository.updateWater(params.key, params.toMap());
  }

  @override
  Stream get status => throw UnimplementedError();
}
