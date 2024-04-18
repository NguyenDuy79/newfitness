import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'activity_state.dart';

class ActivityCubit extends Cubit<ActivityState> {
  ActivityCubit() : super(const ActivityState());

  void addMethodExercise(String exercise) {
    emit(state.copyWith(methodExercise: exercise));
  }

  void addPlanExercise(Map<String, Map<String, String>> map) {
    emit(state.copyWith(exercise: map));
  }

  void addExercise(Map<String, String> map) {
    Map<String, Map<String, String>> newMap = {state.methodExercise: map};
    emit(state.copyWith(exercise: newMap));
  }

  void addDropsetExercise(String exercise) {
    emit(state.copyWith(exerciseDrop: exercise));
  }

  void resetAll() {
    emit(state.copyWith(
        exercise: {},
        methodExercise: '',
        exerciseDrop: '',
        exerciseSuper: [],
        sortData: [],
        restDrop: {},
        set: {},
        time: 0,
        restTime: {},
        setDrop: {}));
  }

  void addDropsetExerciseMap() {
    Map<String, String> newMap = {};
    for (int i = 0; i < state.exercise.values.first.values.length; i++) {
      if (state.exerciseDrop ==
          state.exercise.values.first.values.toList()[i]) {
        newMap.addAll({
          state.exercise.values.first.keys.toList()[i]:
              'Dropset: ${state.exercise.values.first.values.toList()[i]}'
        });
      } else {
        newMap.addAll({
          state.exercise.values.first.keys.toList()[i]:
              state.exercise.values.first.values.toList()[i]
        });
      }
    }
    emit(state.copyWith(
        exercise: {state.exercise.keys.first: newMap}, exerciseDrop: ''));
  }

  void addSuperset(String exercise) {
    List<String> newList = [];
    if (state.exerciseSuper.isEmpty) {
      newList.add(exercise);
    } else {
      for (int i = 0; i < state.exerciseSuper.length; i++) {
        if (state.exerciseSuper[i] == exercise) {
          continue;
        } else {
          newList.add(state.exerciseSuper[i]);
        }
      }
      if (!state.exerciseSuper.contains(exercise) &&
          state.exerciseSuper.length <= 2) {
        newList.add(exercise);
      }
    }
    emit(state.copyWith(exerciseSuper: newList));
  }

  void addSupersetMap() {
    Map<String, String> newMap = {};
    bool first = true;
    bool check = false;
    for (int i = 0; i < state.exercise.values.first.values.length; i++) {
      for (String item in state.exerciseSuper) {
        if (item == state.exercise.values.first.values.toList()[i]) {
          check = true;
          if (first) {
            first = false;
            newMap.addAll({
              state.exercise.values.first.keys.toList()[i]:
                  'Superset: ${getExerciseSuperset(state.exerciseSuper)}'
            });
          } else {
            continue;
          }
        }
      }
      if (!check) {
        newMap.addAll({
          state.exercise.values.first.keys.toList()[i]:
              state.exercise.values.first.values.toList()[i]
        });
      } else {
        check = false;
      }
    }
    emit(state.copyWith(
        exercise: {state.exercise.keys.first: newMap}, exerciseSuper: []));
  }

  String getExerciseSuperset(List<String> string) {
    String result = '';
    for (int i = 0; i < string.length; i++) {
      result += i == 0 ? string[i] : ' + ${string[i]}';
    }
    return result;
  }

  void deleteExercise(int index) {
    Map<String, String> newMap = {};
    for (int i = 0; i < state.exercise.values.first.length; i++) {
      if (index == i) {
        continue;
      } else {
        newMap.addAll({
          state.exercise.values.first.keys.toList()[i]:
              state.exercise.values.first.values.toList()[i]
        });
      }
    }
    emit(state.copyWith(exercise: {state.exercise.keys.first: newMap}));
  }

  void deleteDrop(int index) {
    Map<String, String> newMap = {};
    for (int i = 0; i < state.exercise.values.first.length; i++) {
      if (index == i) {
        newMap.addAll({
          state.exercise.values.first.keys.toList()[i]: state
              .exercise.values.first.values
              .toList()[i]
              .split(':')[1]
              .trim()
        });
      } else {
        newMap.addAll({
          state.exercise.values.first.keys.toList()[i]:
              state.exercise.values.first.values.toList()[i]
        });
      }
    }
    emit(state.copyWith(exercise: {state.exercise.keys.first: newMap}));
  }

  void deleteSuperset(int index) {
    Map<String, String> newMap = {};
    int count = 0;
    for (int i = 0; i < state.exercise.values.first.length; i++) {
      if (index == i) {
        for (String item in state.exercise.values.first.values
            .toList()[i]
            .split(':')[1]
            .trim()
            .split('+')) {
          newMap.addAll({(count += 1).toString(): item.trim()});
        }
      } else {
        newMap.addAll({
          (count += 1).toString():
              state.exercise.values.first.values.toList()[i]
        });
      }
    }
    emit(state.copyWith(exercise: {state.exercise.keys.first: newMap}));
  }

  void addSortList(String exercise) {
    List<String> newList = [];
    if (state.sortData.isEmpty) {
      newList.add(exercise);
    } else {
      for (int i = 0; i < state.sortData.length; i++) {
        if (state.sortData[i] == exercise) {
          continue;
        } else {
          newList.add(state.sortData[i]);
        }
      }
      if (!state.sortData.contains(exercise)) {
        newList.add(exercise);
      }
    }
    emit(state.copyWith(sortData: newList));
  }

  void sortDone() {
    int count = 0;
    Map<String, String> newMap = {};
    for (String item in state.sortData) {
      newMap.addAll({(count += 1).toString(): item});
    }
    emit(state.copyWith(exercise: {state.exercise.keys.first: newMap}));
  }

  void setSet(String value, int index) {
    if (value.isNotEmpty) {
      Map<int, int> newMap = {};

      if (!value.contains('.') && !value.contains(' ')) {
        if (state.set.isEmpty) {
          for (int i = 0; i < state.exercise.values.first.length; i++) {
            if (i == index) {
              newMap.addAll({i: int.parse(value)});
            } else {
              newMap.addAll({i: -1});
            }
          }
        } else {
          for (int i = 0; i < state.exercise.values.first.length; i++) {
            if (i == index) {
              newMap.addAll({i: int.parse(value)});
            } else {
              newMap.addAll({i: state.set[i]!});
            }
          }
        }
      }
      emit(state.copyWith(set: newMap));
    }
  }

  void setRestTime(String value, int index) {
    if (value.isNotEmpty) {
      Map<int, int> newMap = {};
      if (!value.contains('.') && !value.contains(' ')) {
        if (state.restTime.isEmpty) {
          for (int i = 0; i < state.exercise.values.first.length; i++) {
            if (i == index) {
              newMap.addAll({i: int.parse(value)});
            } else {
              newMap.addAll({i: -1});
            }
          }
        } else {
          for (int i = 0; i < state.exercise.values.first.length; i++) {
            if (i == index) {
              newMap.addAll({i: int.parse(value)});
            } else {
              newMap.addAll({i: state.restTime[i]!});
            }
          }
        }
        emit(state.copyWith(restTime: newMap));
      }
    }
  }

  void setSetDrop(String value, int index) {
    if (value.isNotEmpty) {
      Map<int, int> newMap = {};
      if (!value.contains('.') && !value.contains(' ')) {
        List<int> newList = [];
        for (int i = 0; i < state.exercise.values.first.length; i++) {
          if (state.exercise.values.first.values
              .toList()[i]
              .contains('Dropset')) {
            newList.add(i);
          }
        }
        if (state.restDrop.isEmpty) {
          for (int i = 0; i < newList.length; i++) {
            if (newList[i] == index) {
              newMap.addAll({i: int.parse(value)});
            } else {
              newMap.addAll({i: -1});
            }
          }
        } else {
          for (int i = 0; i < newList.length; i++) {
            if (newList[i] == index) {
              newMap.addAll({i: int.parse(value)});
            } else {
              newMap.addAll({i: state.restDrop[i]!});
            }
          }
        }
      }
      emit(state.copyWith(setDrop: newMap));
    }
  }

  void setRestDrop(String value, int index) {
    if (value.isNotEmpty) {
      Map<int, int> newMap = {};
      if (!value.contains('.') && !value.contains(' ')) {
        List<int> newList = [];
        for (int i = 0; i < state.exercise.values.first.length; i++) {
          if (state.exercise.values.first.values
              .toList()[i]
              .contains('Dropset')) {
            newList.add(i);
          }
        }
        if (state.restDrop.isEmpty) {
          for (int i = 0; i < newList.length; i++) {
            if (newList[i] == index) {
              newMap.addAll({i: int.parse(value)});
            } else {
              newMap.addAll({i: -1});
            }
          }
        } else {
          for (int i = 0; i < newList.length; i++) {
            if (newList[i] == index) {
              newMap.addAll({i: int.parse(value)});
            } else {
              newMap.addAll({i: state.restDrop[i]!});
            }
          }
        }
      }

      emit(state.copyWith(restDrop: newMap));
    }
  }

  addSetCardio(String value) {
    if (value.isNotEmpty) {
      Map<int, int> newMap = {};

      if (!value.contains('.') && !value.contains(' ')) {
        newMap.addAll({0: int.parse(value)});
      }
      emit(state.copyWith(set: newMap));
    }
  }

  addRestTimeCardio(String value) {
    if (value.isNotEmpty) {
      Map<int, int> newMap = {};

      if (!value.contains('.') && !value.contains(' ')) {
        newMap.addAll({0: int.parse(value)});
      }
      emit(state.copyWith(restTime: newMap));
    }
  }

  addTimeCardio(String value) {
    if (value.isNotEmpty) {
      if (!value.contains('.') && !value.contains(' ')) {
        emit(state.copyWith(time: int.parse(value)));
      }
    }
  }
}
