import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fitness_nutrition/src/core/resource/app_string.dart';

part 'exericse_state.dart';

class ExericseCubit extends Cubit<ExericseState> {
  ExericseCubit() : super(const ExericseState({}, 1, 0));

  void addAndRemoveExercise(String exercise) {
    Map<String, String> newMap = {};
    int count = 0;
    for (String item in state.map.values.toList()) {
      if (item == exercise) {
        continue;
      } else {
        newMap.addAll({(count += 1).toString(): item});
      }
    }
    if (!state.map.values.toList().contains(exercise)) {
      newMap.addAll({(count += 1).toString(): exercise});
    }
    emit(ExericseState(newMap, 1, 0));
  }

  void addLissExerciseCardio(String exercise) {
    Map<String, String> newMap = {
      'cardioMethod': AppString.lissCardio,
      '1': exercise
    };
    emit(ExericseState(newMap, state.hiitLevel, state.hiitCurrentLevel));
  }

  void addAndRemoveExerciseCardioAnother(
      String exercise, String cardioMethod, String hiitMethod) {
    Map<String, String> newMap = {};
    int count = 0;
    if (hiitMethod.isNotEmpty) {
      newMap.addAll(
        {'cardioMethod': cardioMethod, 'hiitMethod': hiitMethod},
      );
    } else {
      newMap.addAll(
        {'cardioMethod': cardioMethod},
      );
    }
    for (int i = hiitMethod.isNotEmpty ? 2 : 1;
        i < state.map.values.toList().length;
        i++) {
      if (state.map.values.toList()[i] == exercise) {
        continue;
      } else {
        newMap.addAll({(count += 1).toString(): state.map.values.toList()[i]});
      }
    }
    if (!state.map.values.toList().contains(exercise)) {
      newMap.addAll({(count += 1).toString(): exercise});
    }
    emit(ExericseState(newMap, 1, 0));
  }

  void addAndRemoveExerciseCardioGroup(
    String exercise,
  ) {
    Map<String, String> newMap = {};
    int count = 0;
    bool check = true;
    newMap.addAll(
        {'cardioMethod': AppString.hittCardio, 'hiitMethod': AppString.group});
    for (int i = 2; i < state.map.length; i++) {
      if (state.map.keys.toList()[i].split('.')[0] ==
          state.hiitCurrentLevel.toString()) {
        if (state.map[state.map.keys.toList()[i]] == exercise) {
          check = false;
          continue;
        } else {
          newMap.addAll({
            ('${state.hiitCurrentLevel}.${count += 1}'):
                state.map.values.toList()[i]
          });
        }
      }
      {
        newMap
            .addAll({state.map.keys.toList()[i]: state.map.values.toList()[i]});
      }
    }
    if (check) {
      newMap.addAll({('${state.hiitCurrentLevel}.${count += 1}'): exercise});
    }

    emit(ExericseState(newMap, state.hiitLevel, state.hiitCurrentLevel));
  }

  void resetData() {
    emit(const ExericseState({}, 1, 0));
  }

  void increaseLevel() {
    if (state.hiitCurrentLevel < state.hiitLevel) {
      emit(ExericseState(
          state.map, state.hiitLevel, state.hiitCurrentLevel + 1));
    }
  }

  void setData(Map<String, String> map, int level, int currentLevel) {
    emit(ExericseState(map, level, currentLevel));
  }

  void resetMap() {
    emit(ExericseState(const {}, state.hiitLevel, 0));
  }

  void setHiitLeve(int level) {
    emit(ExericseState(state.map, level, 0));
  }

  void reduceLevel() {
    if (state.hiitCurrentLevel > 0) {
      emit(ExericseState(
          state.map, state.hiitLevel, state.hiitCurrentLevel - 1));
    }
  }
}
