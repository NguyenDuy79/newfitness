import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'nutrition_screen_cubit_state.dart';

class NutritionScreenCubit extends Cubit<NutritionScreenCubitState> {
  NutritionScreenCubit() : super(const NutritionScreenCubitState());

  void getTrueValue(int index) {
    emit(state.copyWith(choose: index));
  }

  void changeCalories() {
    emit(state.copyWith(calories: !state.calories));
  }

  void addMoreWater() {
    emit(state.copyWith(water: state.water + 100));
  }

  void reduceWater() {
    if (state.water > 100) {
      emit(state.copyWith(water: state.water - 100));
    }
  }
}
