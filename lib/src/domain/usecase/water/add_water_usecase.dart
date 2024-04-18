import 'package:fitness_nutrition/src/core/use_case/use_case.dart';
import 'package:fitness_nutrition/src/domain/repository/water_repo.dart';

class AddWaterUseCase implements UseCase<void, Map<String, dynamic>> {
  final WaterRepository _waterRepository;
  AddWaterUseCase(this._waterRepository);
  @override
  Future call({required params}) async {
    await _waterRepository.addWater(params);
  }

  @override
  Stream get status => _waterRepository.status;
}
