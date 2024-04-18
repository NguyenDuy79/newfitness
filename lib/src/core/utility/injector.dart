import 'dart:developer';

import 'package:fitness_nutrition/src/data/repository/workout_schedule_impl.dart';
import 'package:fitness_nutrition/src/data/source/local/database/database_manager.dart';
import 'package:fitness_nutrition/src/data/source/local/database/history_database.dart';
import 'package:fitness_nutrition/src/data/source/local/database/infomation_database.dart';
import 'package:fitness_nutrition/src/data/source/local/database/meal_database.dart';
import 'package:fitness_nutrition/src/data/source/local/database/water_database.dart';
import 'package:fitness_nutrition/src/data/source/local/database/workout_schedule.dart';
import 'package:fitness_nutrition/src/domain/usecase/infomation/add_infomation_usecase.dart';
import 'package:fitness_nutrition/src/domain/usecase/infomation/fetch_infomation_usecase.dart';
import 'package:fitness_nutrition/src/domain/usecase/meal/add_meal_usecase.dart';
import 'package:fitness_nutrition/src/domain/usecase/meal/fetch_meal_usecase.dart';
import 'package:fitness_nutrition/src/domain/usecase/water/add_water_usecase.dart';
import 'package:fitness_nutrition/src/domain/usecase/water/fetch_water_usecase.dart';
import 'package:fitness_nutrition/src/domain/usecase/water/update_water_usecase.dart';
import 'package:fitness_nutrition/src/domain/usecase/workout_schedule/update_schedule_usecase.dart';
import 'package:fitness_nutrition/src/presentation/bloc/history_cubit/history_cubit.dart';
import 'package:fitness_nutrition/src/presentation/bloc/meal_cubit/meal_cubit.dart';
import 'package:fitness_nutrition/src/presentation/bloc/schedule_cubit/schedule_cubit.dart';
import 'package:fitness_nutrition/src/presentation/bloc/water_cubit/water_cubit.dart';

import 'package:get_it/get_it.dart';

import '../../data/repository/infomation_repo_impl.dart';
import '../../data/repository/meal_repo_impl.dart';
import '../../data/repository/water_repo_impl.dart';
import '../../domain/repository/infomation_repo.dart';
import '../../domain/repository/meal_repo.dart';
import '../../domain/repository/water_repo.dart';
import '../../domain/repository/workout_schedule_repo.dart';
import '../../domain/usecase/history/add_history_usecase.dart';
import '../../domain/usecase/history/fetch_history_usecase.dart';
import '../../domain/usecase/workout_schedule/add_schedule_usecase.dart';
import '../../domain/usecase/workout_schedule/delete_schedule_usecase.dart';
import '../../domain/usecase/workout_schedule/fetch_schedule_usecase.dart';
import '../../presentation/bloc/infomation_cubit/infomation_cubit.dart';
import '../../presentation/view/action/widget/ticker.dart';

final injector = GetIt.I;

Future<void> initializeDependencies() async {
  try {
    await DatabaseManager.instance.getDatabase();
  } catch (err) {
    log(err.toString());
  }
  // Timer
  injector.registerFactory<Ticker>(() => const Ticker());
  // Database
  injector
      .registerLazySingleton<InfomationDatabase>(() => InfomationDatabase());
  injector.registerLazySingleton<MealDatabase>(() => MealDatabase());
  injector.registerLazySingleton<WaterDatabase>(() => WaterDatabase());
  injector.registerLazySingleton<WorkoutScheduleDatabase>(
      () => WorkoutScheduleDatabase());
  injector.registerLazySingleton<HistoryDatabase>(() => HistoryDatabase());
  // Repository
  injector.registerLazySingleton<InfomationRepository>(
      () => InfomationRepositoryImpl(injector()));
  injector.registerLazySingleton<MealRepository>(
      () => MealRepositoryImpl(injector()));
  injector.registerLazySingleton<WaterRepository>(
      () => WaterRepositoryImpl(injector()));
  injector.registerLazySingleton<WorkoutScheduleRepository>(
    () => WorkoutScheduleRepositoryImpl(injector()),
  );
  // Usecase

  // Usecase infomation
  injector.registerLazySingleton<AddInfomtionUseCase>(
      () => AddInfomtionUseCase(injector()));
  injector.registerLazySingleton<FetchInfomationUseCase>(
    () => FetchInfomationUseCase(injector()),
  );

  // usecase meal
  injector
      .registerLazySingleton<AddMealUseCase>(() => AddMealUseCase(injector()));
  injector.registerLazySingleton<FetchMealUseCase>(
      () => FetchMealUseCase(injector()));

  // usecase water
  injector.registerLazySingleton<AddWaterUseCase>(
      () => AddWaterUseCase(injector()));
  injector.registerLazySingleton<FetchWaterUseCase>(
      () => FetchWaterUseCase(injector()));
  injector.registerLazySingleton<UpdateWaterUseCase>(
      () => UpdateWaterUseCase(injector()));

  // usecase history

  injector.registerLazySingleton<AddHistoryUseCase>(
      () => AddHistoryUseCase(injector()));
  injector.registerLazySingleton<FetchHistoryUseCase>(
      () => FetchHistoryUseCase(injector()));

  // usecase schedule
  injector.registerLazySingleton<AddScheduleUseCase>(
      () => AddScheduleUseCase(injector()));
  injector.registerLazySingleton<FetchScheduleUseCase>(
      () => FetchScheduleUseCase(injector()));
  injector.registerLazySingleton<UpdateWorkoutScheduleUseCase>(
      () => UpdateWorkoutScheduleUseCase(injector()));
  injector.registerLazySingleton<DeleteScheduleUseCase>(
      () => DeleteScheduleUseCase(injector()));
  // InfomationCubit
  // injector.registerFactory<InfomationBodyDartCubit>(
  //     () => InfomationBodyDartCubit(insretDataUseCase: injector()));
  // injector.registerFactory<MealCubit>(
  //     () => MealCubit(insretMealUseCase: injector()));
  // Common bloc
  injector.registerLazySingleton<InfomationCubit>(() => InfomationCubit(
      addInfomtionUseCase: injector(), fetchInfomationUseCase: injector()));
  injector.registerLazySingleton<MealCubit>(() =>
      MealCubit(addMealUseCase: injector(), fetchMealUseCase: injector()));
  injector.registerLazySingleton<HistoryCubit>(() => HistoryCubit(
      addHistoryUseCase: injector(), fetchHistoryUseCase: injector()));
  injector.registerLazySingleton<ScheduleCubit>(() => ScheduleCubit(
      addScheduleUseCase: injector(),
      fetchScheduleUseCase: injector(),
      updateWorkoutScheduleUseCase: injector(),
      deleteScheduleUseCase: injector()));
  injector.registerLazySingleton<WaterCubit>(() => WaterCubit(
      addWaterUseCase: injector(),
      fetchWaterUseCase: injector(),
      updateWaterUseCase: injector()));
}
