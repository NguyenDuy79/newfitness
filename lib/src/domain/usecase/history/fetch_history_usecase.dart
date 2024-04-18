import 'package:fitness_nutrition/src/core/use_case/use_case.dart';
import 'package:fitness_nutrition/src/domain/entities/history.dart';

import '../../repository/history_repo.dart';

class FetchHistoryUseCase implements UserCaseNoParams {
  final HistoryRepository _historyRepository;
  FetchHistoryUseCase(this._historyRepository);
  @override
  Future<List<History>> call() async {
    return await _historyRepository.getAllHistory();
  }
}
