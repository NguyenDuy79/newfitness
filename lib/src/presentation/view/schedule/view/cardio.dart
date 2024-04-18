import 'package:fitness_nutrition/src/core/funtions/get_list_method.dart';
import 'package:fitness_nutrition/src/core/resource/app_dimens.dart';
import 'package:fitness_nutrition/src/presentation/bloc/schedule_cubit/schedule_cubit.dart';
import 'package:fitness_nutrition/src/presentation/view/main/cubit/activity_cubit/activity_cubit.dart';
import 'package:fitness_nutrition/src/presentation/view/main/cubit/change_page_cubit/change_page_cubit.dart';
import 'package:fitness_nutrition/src/presentation/view/schedule/widget/cardio/choose_cardio_method.dart';
import 'package:fitness_nutrition/src/presentation/view/schedule/widget/cardio/choose_hiit_excercise.dart';
import 'package:fitness_nutrition/src/presentation/view/schedule/widget/cardio/choose_hiit_method.dart';
import 'package:fitness_nutrition/src/presentation/view/schedule/widget/cardio/choose_liss_exercise.dart';
import 'package:fitness_nutrition/src/presentation/view/schedule/widget/cardio/set_level.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../core/funtions/day_of_week.dart';
import '../../../../core/resource/app_colors.dart';
import '../../../../core/resource/app_fonts.dart';
import '../../../../core/resource/app_string.dart';
import '../../../widget/global/back_button.dart';

import '../cubit/exercsie_cubit/exericse_cubit.dart';
import '../cubit/schedule_screen_cubit/schedule_screen_cubit.dart';

class ChooseCardio extends StatelessWidget {
  const ChooseCardio(this.controller, {super.key});
  final PageController? controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppDimens.dimens_24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                BlocBuilder<ScheduleScreenMainCubit, ScheduleScreenMainState>(
                  builder: (context, state) {
                    return BlocBuilder<ExericseCubit, ExericseState>(
                      builder: (context, stateExer) {
                        return BackButtonWidget(() {
                          backCardio(context, controller, stateExer, state);
                        });
                      },
                    );
                  },
                ),
                const Expanded(child: SizedBox()),
                BlocBuilder<ScheduleCubit, ScheduleState>(
                  builder: (context, state) {
                    return CupertinoButton(
                        child: Text(
                          'Thoát',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: AppFont.semiBold,
                              color: AppColor.blue.withOpacity(0.8)),
                        ),
                        onPressed: () {
                          exitCardio(context, controller, state);
                        });
                  },
                )
              ],
            ),
            Expanded(
              child:
                  BlocBuilder<ScheduleScreenMainCubit, ScheduleScreenMainState>(
                      builder: (context, state) {
                return state.cardioMethod == ''
                    ? const ChooseCardioMethod()
                    : (state.cardioMethod == AppString.hittCardio
                        ? (state.hiitMethod == ''
                            ? const ChooseHiitMethod()
                            : (state.hiitMethod == AppString.group
                                ? state.chooseExerciseCardio
                                    ? ChooseHiitExercise(controller)
                                    : const SetLevel()
                                : ChooseHiitExercise(controller)))
                        : state.chooseExerciseCardio
                            ? ChooseHiitExercise(controller)
                            : ChooseLissExercise(controller));
              }),
            )
          ],
        ),
      ),
    );
  }
}

void addCardioExercise(BuildContext context, PageController? controller,
    ExericseState state, ScheduleScreenMainState stateSche) {
  if (stateSche.hiitMethod == AppString.group) {
    if (state.hiitCurrentLevel == state.hiitLevel) {
      if (controller == null) {
        context.read<ChangePageCubit>().changePage(6);
        context.read<ActivityCubit>().addExercise(state.map);
      } else {
        context.read<ScheduleScreenMainCubit>().addAndRemoveExercise(state.map);
        controller.animateToPage(3,
            duration: const Duration(microseconds: 300), curve: Curves.linear);
        context.read<ExericseCubit>().resetData();

        context.read<ScheduleScreenMainCubit>().setCardioMethod('');
        context.read<ScheduleScreenMainCubit>().setHiitMethod('');
        context.read<ScheduleScreenMainCubit>().changeChooseExercise(false);
      }
    } else {
      context.read<ExericseCubit>().increaseLevel();
    }
  } else {
    if (controller == null) {
      context.read<ChangePageCubit>().changePage(6);
      context.read<ActivityCubit>().addExercise(state.map);
    } else {
      context.read<ScheduleScreenMainCubit>().addAndRemoveExercise(state.map);
      controller.animateToPage(3,
          duration: const Duration(microseconds: 300), curve: Curves.linear);
      context.read<ExericseCubit>().resetData();

      context.read<ScheduleScreenMainCubit>().setCardioMethod('');
      context.read<ScheduleScreenMainCubit>().setHiitMethod('');
      context.read<ScheduleScreenMainCubit>().changeChooseExercise(false);
    }
  }
}

void exitCardio(
    BuildContext context, PageController? controller, ScheduleState state) {
  if (controller == null) {
    context.read<ExericseCubit>().resetData();
    context.read<ScheduleScreenMainCubit>().setCardioMethod('');
    context.read<ScheduleScreenMainCubit>().setHiitMethod('');
    context.read<ScheduleScreenMainCubit>().changeChooseExercise(false);
    context.read<ActivityCubit>().resetAll();
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
  } else {
    context.read<ExericseCubit>().resetData();
    context.read<ScheduleScreenMainCubit>().setCardioMethod('');
    context.read<ScheduleScreenMainCubit>().setHiitMethod('');
    context.read<ScheduleScreenMainCubit>().changeChooseExercise(false);
    context.read<ScheduleScreenMainCubit>().deleteAllMethod();
    controller.animateToPage(1,
        duration: const Duration(microseconds: 300), curve: Curves.linear);
  }
}

void backCardio(BuildContext context, PageController? controller,
    ExericseState stateExer, ScheduleScreenMainState state) {
  if (state.chooseExerciseCardio == false &&
      state.hiitMethod == '' &&
      state.cardioMethod == '') {
    if (controller == null) {
      context.read<ActivityCubit>().addMethodExercise('');
      context.read<ChangePageCubit>().changePage(1);
    } else {
      context.read<ScheduleScreenMainCubit>().removeAllExercsieMethod();
      controller.animateToPage(3,
          duration: const Duration(microseconds: 300), curve: Curves.linear);
    }
  } else if (state.chooseExerciseCardio == false &&
      state.hiitMethod == '' &&
      state.cardioMethod.isNotEmpty) {
    context.read<ScheduleScreenMainCubit>().setCardioMethod('');
  } else if ((state.chooseExerciseCardio == false &&
      state.hiitMethod.isNotEmpty &&
      state.cardioMethod.isNotEmpty)) {
    context.read<ScheduleScreenMainCubit>().setHiitMethod('');
  } else if ((state.chooseExerciseCardio == true)) {
    if (state.hiitMethod == AppString.group) {
      if (stateExer.hiitCurrentLevel == 1) {
        context.read<ScheduleScreenMainCubit>().changeChooseExercise(false);
        context.read<ExericseCubit>().resetMap();
      } else {
        context.read<ExericseCubit>().reduceLevel();
      }
    } else {
      context.read<ScheduleScreenMainCubit>().changeChooseExercise(false);
      context.read<ExericseCubit>().resetMap();
    }
  }
}
