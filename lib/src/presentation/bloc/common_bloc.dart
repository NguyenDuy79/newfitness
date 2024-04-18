import 'package:fitness_nutrition/src/core/utility/injector.dart';
import 'package:fitness_nutrition/src/presentation/bloc/history_cubit/history_cubit.dart';
import 'package:fitness_nutrition/src/presentation/bloc/meal_cubit/meal_cubit.dart';
import 'package:fitness_nutrition/src/presentation/bloc/schedule_cubit/schedule_cubit.dart';
import 'package:fitness_nutrition/src/presentation/bloc/water_cubit/water_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'infomation_cubit/infomation_cubit.dart';

class CommonBloc {
  CommonBloc._();
  static List<BlocProvider> blocProvider = [
    BlocProvider<InfomationCubit>(create: (context) => injector()),
    BlocProvider<MealCubit>(create: (context) => injector()),
    BlocProvider<WaterCubit>(create: (context) => injector()),
    BlocProvider<HistoryCubit>(create: (context) => injector()),
    BlocProvider<ScheduleCubit>(create: (context) => injector()),
  ];
  static void dispose() {
    injector<InfomationCubit>().close();
    injector<MealCubit>().close();
    injector<WaterCubit>().close();
    injector<HistoryCubit>().close();
    injector<ScheduleCubit>().close();
  }
}
