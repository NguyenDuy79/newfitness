import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'muscle_group_state.dart';

class MuscleGroupCubit extends Cubit<MuscleGroupState> {
  MuscleGroupCubit() : super(const MuscleGroupState([]));
  void addAndRemoveMuscleGroup(String muscleGroup) {
    List<String> newList = [];
    for (String item in state.muscleGroup) {
      if (item == muscleGroup) {
        continue;
      }
      newList.add(item);
    }
    if (!state.muscleGroup.contains(muscleGroup)) {
      newList.add(muscleGroup);
    }
    emit(MuscleGroupState(newList));
  }

  void resetMuscleGroup() {
    emit(const MuscleGroupState([]));
  }
}
