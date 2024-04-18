import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'detail_schedule_state.dart';

class DetailScheduleCubit extends Cubit<DetailScheduleState> {
  DetailScheduleCubit() : super(const DetailScheduleState([], []));

  void addAndRemoveDay(String day) {
    List<String> newListDay = [];
    List<List<int>> newListIndex = [];
    for (int i = 0; i < state.listDay.length; i++) {
      if (state.listDay[i] == day) {
        continue;
      } else {
        newListDay.add(state.listDay[i]);
        newListIndex.add(state.listIndex[i]);
      }
    }
    if (!state.listDay.contains(day)) {
      newListDay.add(day);
      newListIndex.add([]);
    }
    emit(DetailScheduleState(newListDay, newListIndex));
  }

  void addAndRemoveIndex(String day, int index) {
    int indexDay = state.listDay.indexWhere((element) => element == day);
    List<List<int>> newListIndex = [];
    for (int i = 0; i < state.listIndex.length; i++) {
      if (i == indexDay) {
        List<int> newList = [];
        if (state.listIndex[i].isEmpty) {
          newList.add(index);
        } else {
          for (int j = 0; j < state.listIndex[i].length; j++) {
            if (state.listIndex[i][j] == index) {
              continue;
            } else {
              newList.add(state.listIndex[i][j]);
            }
          }
          if (!state.listIndex[i].contains(index)) {
            newList.add(index);
          }
        }
        newListIndex.add(newList);
      } else {
        newListIndex.add(state.listIndex[i]);
      }
    }
    emit(DetailScheduleState(state.listDay, newListIndex));
  }
}
