import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:fitness_nutrition/src/core/funtions/get_list_method.dart';
import 'package:fitness_nutrition/src/core/resource/app_string.dart';
import '../../../../../core/resource/app_another.dart';
part 'schedule_screen_state.dart';

class ScheduleScreenMainCubit extends Cubit<ScheduleScreenMainState> {
  ScheduleScreenMainCubit() : super(const ScheduleScreenMainState());

  void addDayOff(String dayChoose, int minDay) {
    List<String> newList = [];

    for (String day in state.allDay) {
      if (day == dayChoose) {
        if (state.allDay.length > minDay) {
          continue;
        } else {
          newList.add(day);
        }
      } else {
        newList.add(day);
      }
    }
    if (!state.allDay.contains(dayChoose)) {
      newList.add(dayChoose);
    }

    emit(state.copyWith(allDay: sortList(newList)));
  }

  void changeCountDay(int count) {
    emit(state.copyWith(countDay: count));
  }

  void upCountMethod(int countMethod) {
    emit(state.copyWith(countMethod: countMethod));
  }

  void resetListMethods() {
    switch (state.allDay[state.countDay]) {
      case AppString.monday:
        emit(state.copyWith(mon: resetListMethod(state.mon)));
      case AppString.tuesday:
        emit(state.copyWith(tue: resetListMethod(state.tue)));
      case AppString.wednesday:
        emit(state.copyWith(wed: resetListMethod(state.wed)));
      case AppString.thursday:
        emit(state.copyWith(thu: resetListMethod(state.thu)));
      case AppString.friday:
        emit(state.copyWith(fri: resetListMethod(state.fri)));
      case AppString.saturday:
        emit(state.copyWith(sat: resetListMethod(state.sat)));
      default:
        emit(state.copyWith(sun: resetListMethod(state.sun)));
    }
  }

  void deleteAllMethod() {
    switch (state.allDay[state.countDay]) {
      case AppString.monday:
        emit(state.copyWith(mon: []));
      case AppString.tuesday:
        emit(state.copyWith(tue: []));
      case AppString.wednesday:
        emit(state.copyWith(wed: []));
      case AppString.thursday:
        emit(state.copyWith(thu: []));
      case AppString.friday:
        emit(state.copyWith(fri: []));
      case AppString.saturday:
        emit(state.copyWith(sat: []));
      default:
        emit(state.copyWith(sun: []));
    }
  }

  void addMethods(String method) {
    switch (state.allDay[state.countDay]) {
      case AppString.monday:
        emit(state.copyWith(
            mon: listMethodSort(listMethods(method, state.mon))));
      case AppString.tuesday:
        emit(state.copyWith(
            tue: listMethodSort(listMethods(method, state.tue))));
      case AppString.wednesday:
        emit(state.copyWith(
            wed: listMethodSort(listMethods(method, state.wed))));
      case AppString.thursday:
        emit(state.copyWith(
            thu: listMethodSort(listMethods(method, state.thu))));
      case AppString.friday:
        emit(state.copyWith(
            fri: listMethodSort(listMethods(method, state.fri))));
      case AppString.saturday:
        emit(state.copyWith(
            sat: listMethodSort(listMethods(method, state.sat))));
      default:
        emit(state.copyWith(
            sun: listMethodSort(listMethods(method, state.sun))));
    }
  }

  void reduceMethods(String method) {
    switch (state.allDay[state.countDay]) {
      case AppString.monday:
        emit(state.copyWith(
            mon: listMethodSort(listMethodsRemove(method, state.mon))));
      case AppString.tuesday:
        emit(state.copyWith(
            tue: listMethodSort(listMethodsRemove(method, state.tue))));
      case AppString.wednesday:
        emit(state.copyWith(
            wed: listMethodSort(listMethodsRemove(method, state.wed))));
      case AppString.thursday:
        emit(state.copyWith(
            thu: listMethodSort(listMethodsRemove(method, state.thu))));
      case AppString.friday:
        emit(state.copyWith(
            fri: listMethodSort(listMethodsRemove(method, state.fri))));
      case AppString.saturday:
        emit(state.copyWith(
            sat: listMethodSort(listMethodsRemove(method, state.sat))));
      default:
        emit(state.copyWith(
            sun: listMethodSort(listMethodsRemove(method, state.sun))));
    }
  }

  void addAndRemoveExercise(Map<String, String> excercise) {
    switch (state.allDay[state.countDay]) {
      case AppString.monday:
        emit(state.copyWith(
            mon: addAndRemoveExerciseMethods(
                state.mon, excercise, state.countMethod)));
      case AppString.tuesday:
        emit(state.copyWith(
            tue: addAndRemoveExerciseMethods(
                state.tue, excercise, state.countMethod)));
      case AppString.wednesday:
        emit(state.copyWith(
            wed: addAndRemoveExerciseMethods(
                state.wed, excercise, state.countMethod)));
      case AppString.thursday:
        emit(state.copyWith(
            thu: addAndRemoveExerciseMethods(
                state.thu, excercise, state.countMethod)));
      case AppString.friday:
        emit(state.copyWith(
            fri: addAndRemoveExerciseMethods(
                state.fri, excercise, state.countMethod)));
      case AppString.saturday:
        emit(state.copyWith(
            sat: addAndRemoveExerciseMethods(
                state.sat, excercise, state.countMethod)));
      default:
        emit(state.copyWith(
            sun: addAndRemoveExerciseMethods(
                state.sun, excercise, state.countMethod)));
    }
  }

  void removeAllExercsieMethod() {
    switch (state.allDay[state.countDay]) {
      case AppString.monday:
        emit(state.copyWith(
            mon: removeExerciseOfMethod(state.mon, state.countMethod)));
      case AppString.tuesday:
        emit(state.copyWith(
            tue: removeExerciseOfMethod(state.tue, state.countMethod)));
      case AppString.wednesday:
        emit(state.copyWith(
            wed: removeExerciseOfMethod(state.wed, state.countMethod)));
      case AppString.thursday:
        emit(state.copyWith(
            thu: removeExerciseOfMethod(state.thu, state.countMethod)));
      case AppString.friday:
        emit(state.copyWith(
            fri: removeExerciseOfMethod(state.fri, state.countMethod)));
      case AppString.saturday:
        emit(state.copyWith(
            sat: removeExerciseOfMethod(state.sat, state.countMethod)));
      default:
        emit(state.copyWith(
            sun: removeExerciseOfMethod(state.sun, state.countMethod)));
    }
  }

  void setCardioMethod(String method) {
    emit(state.copyWith(cardioMethod: method));
  }

  void setHiitMethod(String method) {
    emit(state.copyWith(hiitMethod: method));
  }

  // void resetCardioMethod() {
  //   emit(state.copyWith(cardioMethod: ''));
  // }

  // void resetHiitMethod() {
  //   emit(state.copyWith(hiitMethod: ''));
  // }

  void setLevel(String level) {
    if (level.contains(' ') || level.contains('.')) {
      emit(
          state.copyWith(levelError: 'Vui lòng nhập đúng mức độ bạn muốn tập'));
    } else {
      if (int.parse(level) <= 0) {
        emit(state.copyWith(levelError: 'Vui lòng nhập đúng mức độ lớn hơn 0'));
      } else {
        emit(state.copyWith(hiitLevel: int.parse(level)));
      }
    }
  }

  void changeChooseExercise(bool show) {
    emit(state.copyWith(chooseExerciseCardio: show));
  }

  List<Map<String, Map<String, String>>> removeExerciseOfMethod(
      List<Map<String, Map<String, String>>> map, int index) {
    List<Map<String, Map<String, String>>> newList = [];
    for (int i = 0; i < map.length; i++) {
      if (i == index) {
        newList.add({map[i].keys.first: {}});
      } else {
        newList.add(map[i]);
      }
    }
    return newList;
  }

  List<Map<String, Map<String, String>>> addAndRemoveExerciseMethods(
      List<Map<String, Map<String, String>>> map,
      Map<String, String> mapExercise,
      int countMethod) {
    List<Map<String, Map<String, String>>> newList = [];

    for (int i = 0; i < map.length; i++) {
      if (i == countMethod) {
        newList.add({map[i].keys.first: mapExercise});
      } else {
        newList.add(map[i]);
      }
    }
    return newList;
  }

  List<Map<String, Map<String, String>>> listMethodsRemove(
      String method, List<Map<String, Map<String, String>>> map) {
    List<Map<String, Map<String, String>>> newList = [];
    bool first = true;

    for (Map<String, Map<String, String>> item in map.reversed) {
      if (item.keys.first == method && first) {
        first = false;
        continue;
      }
      newList.add(item);
    }

    return newList.reversed.toList();
  }

  List<Map<String, Map<String, String>>> listMethodSort(
      List<Map<String, Map<String, String>>> map) {
    List<Map<String, Map<String, String>>> newList = [];
    for (Map<String, Map<String, String>> item in map) {
      if (item.keys.first == AppAnother.exerciseMethod[0]) {
        newList.add(item);
      }
    }
    for (Map<String, Map<String, String>> item in map) {
      if (item.keys.first == AppAnother.exerciseMethod[1]) {
        newList.add(item);
      }
    }
    for (Map<String, Map<String, String>> item in map) {
      if (item.keys.first == AppAnother.exerciseMethod[2]) {
        newList.add(item);
      }
    }
    return newList;
  }

  List<Map<String, Map<String, String>>> listMethods(
      String method, List<Map<String, Map<String, String>>> map) {
    List<Map<String, Map<String, String>>> newList = [];
    Map<String, Map<String, String>> newMap = {method: {}};
    for (Map<String, Map<String, String>> item in map) {
      newList.add(item);
    }
    newList.add(newMap);
    return newList;
  }

  List<String> sortList(List<String> listDay) {
    List<String> newList = [];
    for (String day in AppAnother.listDayOfWeek) {
      int index = listDay.indexWhere((element) => element == day);
      if (index >= 0) {
        newList.add(day);
      }
    }
    return newList;
  }
}
