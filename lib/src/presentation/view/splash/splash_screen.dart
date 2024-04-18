import 'package:fitness_nutrition/src/presentation/bloc/schedule_cubit/schedule_cubit.dart';
import 'package:fitness_nutrition/src/presentation/bloc/water_cubit/water_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/route/route_generator_route.dart';
import '../../bloc/infomation_cubit/infomation_cubit.dart';
import '../../bloc/meal_cubit/meal_cubit.dart';
import 'splash_cubit/splash_cubit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final WaterState stateWater =
        context.select((WaterCubit cubit) => cubit.state);
    final MealState stateMeal =
        context.select((MealCubit cubit) => cubit.state);
    final ScheduleState stateSche =
        context.select((ScheduleCubit cubit) => cubit.state);
    final InfomationState stateInfo =
        context.select((InfomationCubit cubit) => cubit.state);
    if (stateWater.check != 0 &&
        stateInfo.check != 0 &&
        stateMeal.check != 0 &&
        stateSche.check != 0) {
      if (stateInfo.check == 1) {
        context.read<SplashCubit>().onChangeSplash(false);
      } else {
        context.read<SplashCubit>().onChangeSplash(true);
      }
    }
    return BlocConsumer<SplashCubit, SplashState>(
        listener: (context, state) async {
      if (state is SplashLoaded) {
        if (state.check) {
          Navigator.pushReplacementNamed(context, RouteGenerator.mainScreen);
        } else {
          Navigator.pushReplacementNamed(context, RouteGenerator.firstScreen);
        }
      }
    }, builder: (context, stateSplash) {
      return Scaffold(
        body: Center(
          child: SizedBox(
            height: size.height * 0.6,
            width: size.width * 0.6,
            child: Image.asset('assets/images/cbum.png'),
          ),
        ),
      );
    });
  }
}
