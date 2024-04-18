import 'package:fitness_nutrition/src/core/use_case/use_case.dart';
import 'package:fitness_nutrition/src/domain/entities/infomation.dart';
import 'package:fitness_nutrition/src/domain/repository/infomation_repo.dart';

class FetchInfomationUseCase implements UserCaseNoParams {
  final InfomationRepository _infomationRepository;
  FetchInfomationUseCase(this._infomationRepository);
  @override
  Future<List<Infomation>> call() async {
    return await _infomationRepository.getAllInfomation();
  }
}
