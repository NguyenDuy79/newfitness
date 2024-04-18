import 'package:fitness_nutrition/src/presentation/view/into/bloc/cubit/infomation_body_dart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'pages/age_screen.dart';
import 'pages/body_fat_screen.dart';
import 'pages/gender_screen.dart';
import 'pages/goal_screen.dart';
import 'pages/height_screen.dart';
import 'pages/ratio_nutrition.dart';
import 'pages/start_screen.dart';

import 'pages/traning_day_screen.dart';
import 'pages/weight_sceen.dart';

class MainSetupScreen extends StatelessWidget {
  const MainSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          return true;
        },
        child: SafeArea(
          child: BlocBuilder<InfomationBodyDartCubit, InfomationBodyDartState>(
              buildWhen: (previous, current) => previous.index != current.index,
              builder: (context, state) => listPages[state.index]),
        ),
      ),
    );
  }
}

List<Widget> listPages = [
  const StartScreen(),
  const GenderScreen(),
  const MainGoalScreen(),
  BodyFatWidget(),
  const ChooseAgeScreen(),
  const ChooseHeightWidget(),
  const ChooseWeightWidget(),
  const ChoooseTrainingDay(),
  const RatioNutrition()
  // FitnessTrainingExperience(controller)
];
