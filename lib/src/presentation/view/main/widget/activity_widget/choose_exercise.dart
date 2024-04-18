import 'package:fitness_nutrition/src/core/resource/app_another.dart';
import 'package:fitness_nutrition/src/core/resource/app_dimens.dart';
import 'package:fitness_nutrition/src/core/resource/app_fonts.dart';
import 'package:fitness_nutrition/src/core/resource/app_string.dart';
import 'package:fitness_nutrition/src/presentation/bloc/schedule_cubit/schedule_cubit.dart';
import 'package:fitness_nutrition/src/presentation/view/main/cubit/activity_cubit/activity_cubit.dart';
import 'package:fitness_nutrition/src/presentation/view/main/cubit/change_page_cubit/change_page_cubit.dart';
import 'package:fitness_nutrition/src/presentation/view/schedule/view/calisthenics.dart';
import 'package:fitness_nutrition/src/presentation/view/schedule/view/cardio.dart';
import 'package:fitness_nutrition/src/presentation/view/schedule/view/gym.dart';
import 'package:fitness_nutrition/src/presentation/view/schedule/widget/cardio/cardio_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../core/funtions/day_of_week.dart';
import '../../../../../core/funtions/get_list_method.dart';
import '../../../../widget/global/back_button.dart';
import '../../../schedule/cubit/exercsie_cubit/exericse_cubit.dart';
import '../../../schedule/cubit/muscle_group/muscle_group_cubit.dart';

class ChooseExercise extends StatelessWidget {
  const ChooseExercise({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActivityCubit, ActivityState>(builder: (context, state) {
      return state.methodExercise == ''
          ? chooseExerciseMethod()
          : state.methodExercise == AppString.inTheGym
              ? const Gym(null, doneButton, backButton, exitButton)
              : state.methodExercise == AppString.calisthenics
                  ? const Calisthenics(null, doneButton, backButton, exitButton)
                  : const ChooseCardio(
                      null,
                    );
    });
  }
}

Widget chooseExerciseMethod() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.dimens_18, vertical: AppDimens.dimens_8),
        child: BlocBuilder<ScheduleCubit, ScheduleState>(
            builder: (context, state) {
          final List<DateTime> listDateTime = getWeek(DateTime.now());
          return getList(
                  state.allWorkoutSchedulel,
                  listDateTime.indexWhere(
                    (element) =>
                        DateFormat('E').format(DateTime.now()) ==
                        DateFormat('E').format(element),
                  )).isNotEmpty
              ? BackButtonWidget(() {
                  context.read<ChangePageCubit>().changePage(0);
                })
              : const SizedBox();
        }),
      ),
      Expanded(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Chọn phương pháp tập',
            style: TextStyle(
                fontSize: AppDimens.dimens_24, fontWeight: AppFont.semiBold),
          ),
          const SizedBox(
            height: AppDimens.dimens_20,
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: AppDimens.dimens_15),
            height: AppDimens.dimens_60 * AppAnother.exerciseMethod.length,
            child: ListView.builder(
                padding: const EdgeInsets.all(AppDimens.dimens_0),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: AppAnother.exerciseMethod.length,
                itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        context.read<ActivityCubit>().addMethodExercise(
                            AppAnother.exerciseMethod[index]);
                      },
                      child: Column(
                        children: [
                          CardioButtonWidget(AppAnother.exerciseMethod[index]),
                          const SizedBox(
                            height: AppDimens.dimens_15,
                          )
                        ],
                      ),
                    )),
          ),
        ],
      ))
    ],
  );
}

backButton(BuildContext context) {
  context.read<ActivityCubit>().addMethodExercise('');
  context.read<ExericseCubit>().resetData();

  context.read<MuscleGroupCubit>().resetMuscleGroup();
}

exitButton(BuildContext context, ScheduleState state) {
  context.read<ActivityCubit>().resetAll();
  context.read<ExericseCubit>().resetData();
  context.read<MuscleGroupCubit>().resetMuscleGroup();
  final List<DateTime> listDateTime = getWeek(DateTime.now());

  if (getList(
      state.allWorkoutSchedulel,
      listDateTime.indexWhere(
        (element) =>
            DateFormat('E').format(DateTime.now()) ==
            DateFormat('E').format(element),
      )).isNotEmpty) {
    context.read<ChangePageCubit>().changePage(0);
  } else {
    context.read<ChangePageCubit>().changePage(1);
  }
}

doneButton(BuildContext context, ExericseState state) {
  context.read<ActivityCubit>().addExercise(state.map);
  context.read<ChangePageCubit>().changePage(2);
}
