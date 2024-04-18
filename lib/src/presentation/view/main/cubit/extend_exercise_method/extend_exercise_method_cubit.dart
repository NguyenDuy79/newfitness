import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'extend_exercise_method_state.dart';

class ExtendExerciseMethodCubit extends Cubit<ExtendExerciseMethodState> {
  ExtendExerciseMethodCubit() : super(ExtendExerciseMethodState([]));

  addAndRemoveIndex(int index) {
    List<int> newList = [];
    if (state.listIndex.isEmpty) {
      newList.add(index);
    } else {
      for (int item in state.listIndex) {
        if (item == index) {
          continue;
        } else {
          newList.add(item);
        }
      }
      if (!state.listIndex.contains(index)) {
        newList.add(index);
      }
    }

    emit(ExtendExerciseMethodState(newList));
  }

  addZero() {
    emit(ExtendExerciseMethodState([0]));
  }

  resetIndex() {
    emit(ExtendExerciseMethodState([]));
  }
}
