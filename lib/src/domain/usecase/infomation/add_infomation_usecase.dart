import 'package:fitness_nutrition/src/core/use_case/use_case.dart';
import 'package:fitness_nutrition/src/domain/repository/infomation_repo.dart';

class AddInfomtionUseCase implements UseCase<void, Map<String, dynamic>> {
  final InfomationRepository _infomationRepository;
  AddInfomtionUseCase(this._infomationRepository);
  @override
  Future<void> call({required params}) async {
    await _infomationRepository.addInfomation(params);
  }

  @override
  Stream get status => _infomationRepository.status;
}
