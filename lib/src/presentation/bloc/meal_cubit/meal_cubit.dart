import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fitness_nutrition/src/domain/usecase/meal/add_meal_usecase.dart';
import 'package:fitness_nutrition/src/domain/usecase/meal/fetch_meal_usecase.dart';
import 'package:formz/formz.dart';
import '../../../domain/entities/meal.dart';
part 'meal_state.dart';

class MealCubit extends Cubit<MealState> {
  final AddMealUseCase _addMealUseCase;
  final FetchMealUseCase _fetchMealUseCase;
  StreamSubscription? _streamSubscription;
  MealCubit({
    required AddMealUseCase addMealUseCase,
    required FetchMealUseCase fetchMealUseCase,
  })  : _addMealUseCase = addMealUseCase,
        _fetchMealUseCase = fetchMealUseCase,
        super(const MealState([], FormzSubmissionStatus.initial, 0)) {
    _streamSubscription = _addMealUseCase.status.listen((event) async {
      List<Meal> listData = await _fetchMealUseCase.call();
      emit(MealState(listData, state.status, 1));
    });
  }
  Future<void> enterMeal(Map<String, dynamic> map) async {
    emit(MealState(state.allMeal, FormzSubmissionStatus.inProgress, 1));
    try {
      await _addMealUseCase.call(params: map);
      emit(MealState(state.allMeal, FormzSubmissionStatus.success, 1));
    } catch (err) {
      emit(MealState(state.allMeal, FormzSubmissionStatus.failure, 1));
    }
  }

  @override
  Future<void> close() {
    _streamSubscription!.cancel();
    return super.close();
  }
}
