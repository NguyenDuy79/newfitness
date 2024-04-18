import 'package:fitness_nutrition/src/core/funtions/get_list_method.dart';
import 'package:fitness_nutrition/src/core/resource/app_another.dart';
import 'package:fitness_nutrition/src/core/resource/app_colors.dart';
import 'package:fitness_nutrition/src/core/resource/app_dimens.dart';

import 'package:fitness_nutrition/src/domain/entities/workout_schedule.dart';
import 'package:fitness_nutrition/src/presentation/bloc/schedule_cubit/schedule_cubit.dart';
import 'package:fitness_nutrition/src/presentation/view/main/cubit/detail_schedule_cubit/detail_schedule_cubit.dart';
import 'package:fitness_nutrition/src/presentation/view/main/screen/plan_screen.dart';
import 'package:fitness_nutrition/src/presentation/view/main/widget/plan_widget/list_method_and_exercise.dart';
import 'package:fitness_nutrition/src/presentation/widget/global/bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class ModalPopupScheduleShowWidget extends StatelessWidget {
  const ModalPopupScheduleShowWidget(this.workoutSchedule, {super.key});
  final WorkoutSchedule workoutSchedule;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailScheduleCubit(),
      child: CupertinoPopupSurface(
        child: Container(
          color: AppColor.grey1,
          padding: const EdgeInsets.only(bottom: AppDimens.dimens_15),
          height: MediaQuery.of(context).size.height * 0.5,
          child: Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppDimens.dimens_10,
                    vertical: AppDimens.dimens_15),
                child: BlocBuilder<DetailScheduleCubit, DetailScheduleState>(
                  builder: (context, state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (int i = 0; i < 7; i++)
                          Column(
                            children: [
                              CupertinoButton(
                                  child: Row(
                                    children: [
                                      Text(
                                        AppAnother.listDayOfWeek[i],
                                        style: const TextStyle(
                                            color: AppColor.black),
                                      ),
                                      const SizedBox(
                                        width: AppDimens.dimens_5,
                                      ),
                                      Icon(
                                        state.listDay.contains(
                                                AppAnother.listDayOfWeek[i])
                                            ? Icons.arrow_drop_up_outlined
                                            : Icons.arrow_drop_down,
                                        color: AppColor.black,
                                      ),
                                    ],
                                  ),
                                  onPressed: () {
                                    context
                                        .read<DetailScheduleCubit>()
                                        .addAndRemoveDay(
                                            AppAnother.listDayOfWeek[i]);
                                  }),
                              if (state.listDay
                                  .contains(AppAnother.listDayOfWeek[i]))
                                ListMethodAndExerciseWidget(
                                    getListDetail(workoutSchedule,
                                        AppAnother.listDayOfWeek[i]),
                                    AppAnother.listDayOfWeek[i],
                                    state.listIndex[state.listDay.indexWhere(
                                        (element) =>
                                            element ==
                                            AppAnother.listDayOfWeek[i])])
                            ],
                          ),
                      ],
                    );
                  },
                ),
              ),
            ),
            bottomNavigationBar: BlocConsumer<ScheduleCubit, ScheduleState>(
              listener: (context, state) {
                if (state.status == FormzSubmissionStatus.failure) {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: AppColor.black.withOpacity(0.6),
                      content: const Text('Có lỗi gì đó, hãy thử lại')));
                  Navigator.of(context).pop();
                }
              },
              builder: (context, state) {
                return BottomNavigationBarWidget(() async {
                  if (workoutSchedule.check) {
                    context
                        .read<ScheduleCubit>()
                        .updateItemSubmit(workoutSchedule)
                        .then((value) => Navigator.of(context).pop());
                  } else {
                    if (indexWorkoutSchedule(state.allWorkoutSchedulel) ==
                        null) {
                      context
                          .read<ScheduleCubit>()
                          .updateItemSubmit(workoutSchedule)
                          .then((value) => Navigator.of(context).pop());
                    } else {
                      context
                          .read<ScheduleCubit>()
                          .updateItemSubmit(workoutSchedule)
                          .then((value) async => await context
                              .read<ScheduleCubit>()
                              .updateItemSubmit(indexWorkoutSchedule(
                                  state.allWorkoutSchedulel)!))
                          .then((value) => Navigator.of(context).pop());
                    }
                  }
                },
                    state.status == FormzSubmissionStatus.inProgress
                        ? false
                        : true,
                    !workoutSchedule.check ? 'Đặt làm lịch' : 'Gỡ lịch');
              },
            ),
          ),
        ),
      ),
    );
  }
}
