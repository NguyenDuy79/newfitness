import 'package:fitness_nutrition/src/presentation/view/schedule/view/calisthenics.dart';
import 'package:fitness_nutrition/src/presentation/view/schedule/view/cardio.dart';
import 'package:fitness_nutrition/src/presentation/view/schedule/view/choose_day_off.dart';
import 'package:fitness_nutrition/src/presentation/view/schedule/view/choose_plan.dart';
import 'package:fitness_nutrition/src/presentation/view/schedule/view/day_action.dart';
import 'package:fitness_nutrition/src/presentation/view/schedule/view/gym.dart';
import 'package:fitness_nutrition/src/presentation/view/schedule/view/method_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/exercsie_cubit/exericse_cubit.dart';
import '../cubit/muscle_group/muscle_group_cubit.dart';
import '../cubit/schedule_screen_cubit/schedule_screen_cubit.dart';

class ScheduleMainScreen extends StatelessWidget {
  ScheduleMainScreen({super.key});
  final PageController controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller,
          itemBuilder: (context, index) {
            return listPages(controller)[index];
          },
        ),
      ),
    );
  }
}

List<Widget> listPages(PageController controller) {
  return [
    ChooseDayOff(controller),
    DayAction(controller),
    ChoosePlans(controller),
    MethodAction(controller),
    Gym(controller, null, null, null),
    Calisthenics(controller, null, null, null),
    ChooseCardio(
      controller,
    )
  ];
}

void doneButton(
    BuildContext context, PageController controller, ExericseState state) {
  context.read<MuscleGroupCubit>().resetMuscleGroup();

  context.read<ScheduleScreenMainCubit>().addAndRemoveExercise(state.map);
  context.read<ExericseCubit>().resetData();
  controller.animateToPage(3,
      duration: const Duration(microseconds: 300), curve: Curves.linear);
}

void backButton(BuildContext context, PageController controller) {
  context.read<ScheduleScreenMainCubit>().removeAllExercsieMethod();
  context.read<ExericseCubit>().resetData();
  context.read<MuscleGroupCubit>().resetMuscleGroup();
  controller.animateToPage(3,
      duration: const Duration(microseconds: 300), curve: Curves.linear);
}

void exitButton(BuildContext context, PageController controller) {
  context.read<ExericseCubit>().resetData();
  context.read<ScheduleScreenMainCubit>().deleteAllMethod();
  context.read<MuscleGroupCubit>().resetMuscleGroup();
  controller.animateToPage(1,
      duration: const Duration(microseconds: 300), curve: Curves.linear);
}
