import 'package:fitness_nutrition/src/core/resource/app_dimens.dart';
import 'package:fitness_nutrition/src/presentation/view/main/widget/activity_widget/all_exercise_of_plan.dart';
import 'package:fitness_nutrition/src/presentation/view/main/widget/activity_widget/choose_drop_set.dart';
import 'package:fitness_nutrition/src/presentation/view/main/widget/activity_widget/choose_exercise.dart';
import 'package:fitness_nutrition/src/presentation/view/main/widget/activity_widget/choose_plan.dart';
import 'package:fitness_nutrition/src/presentation/view/main/widget/activity_widget/choose_super_set.dart';
import 'package:fitness_nutrition/src/presentation/view/main/widget/activity_widget/set_and_rest_time.dart';
import 'package:fitness_nutrition/src/presentation/view/main/widget/activity_widget/sort_all_exercise.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/change_page_cubit/change_page_cubit.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(bottom: AppDimens.dimens_104),
        child: BlocBuilder<ChangePageCubit, int>(
          builder: (context, state) {
            return listPages[state];
          },
        ),
      ),
    );
  }
}

List<Widget> listPages = const [
  ChoosePlan(),
  ChooseExercise(),
  AllExerciseOfPlan(),
  ChooseDropSet(),
  ChooseSuperSet(),
  SortAllExercise(),
  SetAndRestTime()
];
