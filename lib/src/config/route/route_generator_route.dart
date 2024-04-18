import 'package:fitness_nutrition/src/core/utility/injector.dart';
import 'package:fitness_nutrition/src/domain/entities/activity.dart';
import 'package:fitness_nutrition/src/presentation/view/action/action_screen.dart';
import 'package:fitness_nutrition/src/presentation/view/action/cubit/action_cubit/action_cubit.dart';
import 'package:fitness_nutrition/src/presentation/view/action/cubit/timer_bloc/timer_cubit.dart';
import 'package:fitness_nutrition/src/presentation/view/first/first_cubit.dart';
import 'package:fitness_nutrition/src/presentation/view/into/bloc/cubit/infomation_body_dart_cubit.dart';
import 'package:fitness_nutrition/src/presentation/view/main/cubit/activity_cubit/activity_cubit.dart';
import 'package:fitness_nutrition/src/presentation/view/main/cubit/change_page_cubit/change_page_cubit.dart';

import 'package:fitness_nutrition/src/presentation/view/main/cubit/extend_exercise_method/extend_exercise_method_cubit.dart';
import 'package:fitness_nutrition/src/presentation/view/main/cubit/main_page_cubit/main_page_index_cubit.dart';
import 'package:fitness_nutrition/src/presentation/view/main/cubit/nutrition_screen/nutrition_screen_cubit_cubit.dart';
import 'package:fitness_nutrition/src/presentation/view/schedule/cubit/exercsie_cubit/exericse_cubit.dart';
import 'package:fitness_nutrition/src/presentation/view/schedule/cubit/muscle_group/muscle_group_cubit.dart';
import 'package:fitness_nutrition/src/presentation/view/schedule/view/schedule_main_screen.dart';
import 'package:fitness_nutrition/src/presentation/view/splash/splash_cubit/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../presentation/view/first/first_screen.dart';
import '../../presentation/view/into/view/main_into_screen.dart';
import '../../presentation/view/main/cubit/schedule_screen_cubit/schedule_screen_cubit.dart';
import '../../presentation/view/main/screen/activity_screen.dart';
import '../../presentation/view/main/screen/home_screen.dart';
import '../../presentation/view/main/screen/main_screen.dart';
import '../../presentation/view/main/screen/more_creen.dart';
import '../../presentation/view/main/screen/nutrition_screen.dart';
import '../../presentation/view/main/screen/plan_screen.dart';
import '../../presentation/view/meal/bloc/meal/meal_cubit.dart';
import '../../presentation/view/meal/meal.dart';
import '../../presentation/view/schedule/cubit/schedule_screen_cubit/schedule_screen_cubit.dart';
import '../../presentation/view/splash/splash_screen.dart';

class RouteGenerator {
  RouteGenerator._();
  static const mainScreen = '/main-screen';
  static const splashScreen = '/splash-screen';
  static const intoScreen = '/into-screen';
  static const setupScreen = 'setup-screen';
  static const firstScreen = '/first-screen';
  static const mealScreen = '/meal-screen';
  static const setPlanScreen = '/set-plan-screen';
  static const actionScreen = '/action-screen';
  static List<Widget> listPage = [
    const HomeScreen(),
    const NutritionScreen(),
    const ActivityScreen(),
    const PlanScreen(),
    const MoreScreen()
  ];
  static Route<dynamic> generatorRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => SplashCubit(),
            child: const SplashScreen(),
          ),
        );
      case firstScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<FirstCubit>(
            create: (context) => FirstCubit(),
            child: const FirstScreen(),
          ),
        );
      case setupScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<InfomationBodyDartCubit>(
            create: (context) => InfomationBodyDartCubit(),
            child: const MainSetupScreen(),
          ),
        );
      case mainScreen:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider<ScheduleScreenMainCubit>(
                  create: (context) => ScheduleScreenMainCubit()),
              BlocProvider<ChangePageCubit>(
                  create: (context) => ChangePageCubit()),
              BlocProvider<ActivityCubit>(create: (context) => ActivityCubit()),
              BlocProvider<MainPageIndexCubit>(
                  create: (context) => MainPageIndexCubit()),
              BlocProvider<ExtendExerciseMethodCubit>(
                  create: (context) => ExtendExerciseMethodCubit()),
              BlocProvider<NutritionScreenCubit>(
                  create: (context) => NutritionScreenCubit()),
              BlocProvider<ScheduleScreenCubit>(
                  create: (context) => ScheduleScreenCubit()),
              BlocProvider<MuscleGroupCubit>(
                create: (context) => MuscleGroupCubit(),
              ),
              BlocProvider<ExericseCubit>(
                create: (context) => ExericseCubit(),
              )
            ],
            child: const MainScreen(),
          ),
        );
      case mealScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider<MealScreenCubit>(
                  create: (context) => MealScreenCubit(),
                  child: const MealScreen(),
                ));
      case setPlanScreen:
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(providers: [
                  BlocProvider<ScheduleScreenMainCubit>(
                    create: (context) => ScheduleScreenMainCubit(),
                  ),
                  BlocProvider<MuscleGroupCubit>(
                    create: (context) => MuscleGroupCubit(),
                  ),
                  BlocProvider<ExericseCubit>(
                    create: (context) => ExericseCubit(),
                  )
                ], child: ScheduleMainScreen()));
      case actionScreen:
        var args = settings.arguments as Activity;
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider<ActionCubit>(
                        create: (context) => ActionCubit()),
                    BlocProvider<TimerCubit>(
                        create: (context) => TimerCubit(ticker: injector())),
                  ],
                  child: ActionScreen(args),
                ));
      default:
        return _exceptionRoute();
    }
  }

  static Route<dynamic> _exceptionRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text('Error'),
              ),
              body: const Center(
                child: Text('ERROR'),
              ),
            ));
  }
}
