import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/resource/app_another.dart';
import '../../../../../domain/entities/food.dart';

part 'meal_state.dart';

class MealScreenCubit extends Cubit<MealScreenState> {
  MealScreenCubit() : super(const MealScreenState());

  void searchFood(String name) {
    List<Food> newList = [];
    for (int i = 0; i < AppAnother.listFood.length; i++) {
      if (AppAnother.listFood[i].name
          .toLowerCase()
          .contains(name.toLowerCase())) {
        newList.add(AppAnother.listFood[i]);
      }
    }
    emit(state.copyWith(listFood: newList));
  }

  void addFood(double weight, Food food) {
    List<Map<double, Food>> newList = [];
    bool check = false;
    for (int i = 0; i < state.listFoodChoosed.length; i++) {
      if (state.listFoodChoosed[i].values.first.name == food.name) {
        check = true;
        Map<double, Food> newMap = {
          state.listFoodChoosed[i].keys.first + weight: food
        };
        newList.add(newMap);
      } else {
        newList.add(state.listFoodChoosed[i]);
      }
    }
    if (!check) {
      newList.add({weight: food});
    }

    emit(state.copyWith(listFoodChoosed: newList));
  }

  void deleteFood(double weight, Food food) {
    List<Map<double, Food>> newList = [];

    for (int i = 0; i < state.listFoodChoosed.length; i++) {
      if (state.listFoodChoosed[i].values.first.name == food.name) {
        continue;
      } else {
        newList.add(state.listFoodChoosed[i]);
      }
    }

    emit(state.copyWith(listFoodChoosed: newList));
  }
}
