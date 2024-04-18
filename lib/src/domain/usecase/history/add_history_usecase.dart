import 'package:fitness_nutrition/src/core/use_case/use_case.dart';

import 'package:fitness_nutrition/src/domain/repository/history_repo.dart';

class AddHistoryUseCase implements UseCase<void, Map<String, dynamic>> {
  final HistoryRepository _historyRepository;
  AddHistoryUseCase(this._historyRepository);
  @override
  Future<void> call({required params}) async {
    await _historyRepository.addHistory(params);
  }

  @override
  Stream get status => _historyRepository.status;
}
