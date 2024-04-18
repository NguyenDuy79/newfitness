import 'package:fitness_nutrition/src/presentation/view/main/cubit/activity_cubit/activity_cubit.dart';
import 'package:fitness_nutrition/src/presentation/view/main/cubit/change_page_cubit/change_page_cubit.dart';
import 'package:fitness_nutrition/src/presentation/widget/global/bottom_navigation_bar.dart';
import 'package:fitness_nutrition/src/presentation/widget/global/button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../core/funtions/day_of_week.dart';
import '../../../../../core/funtions/get_list_method.dart';
import '../../../../../core/resource/app_colors.dart';
import '../../../../../core/resource/app_dimens.dart';
import '../../../../../core/resource/app_fonts.dart';
import '../../../../bloc/schedule_cubit/schedule_cubit.dart';
import '../../../../widget/global/back_button.dart';
import '../../../schedule/cubit/exercsie_cubit/exericse_cubit.dart';
import '../../../schedule/cubit/muscle_group/muscle_group_cubit.dart';

class ChooseDropSet extends StatelessWidget {
  const ChooseDropSet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppDimens.dimens_24),
        child: Column(
          children: [
            Row(
              children: [
                BackButtonWidget(() {
                  context.read<ChangePageCubit>().changePage(2);
                }),
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
                          List<DateTime> listDateTime = getWeek(DateTime.now());
                          context.read<MuscleGroupCubit>().resetMuscleGroup();
                          context.read<ExericseCubit>().resetData();
                          context.read<ActivityCubit>().resetAll();
                          getList(
                                  state.allWorkoutSchedulel,
                                  listDateTime.indexWhere(
                                    (element) =>
                                        DateFormat('E')
                                            .format(DateTime.now()) ==
                                        DateFormat('E').format(element),
                                  )).isNotEmpty
                              ? context.read<ChangePageCubit>().changePage(0)
                              : context.read<ChangePageCubit>().changePage(1);
                        });
                  },
                )
              ],
            ),
            const SizedBox(
              height: AppDimens.dimens_16,
            ),
            BlocBuilder<ActivityCubit, ActivityState>(
              builder: (context, state) {
                return SizedBox(
                  height:
                      state.exercise.values.first.length * AppDimens.dimens_60,
                  child: ListView.builder(
                      itemCount: state.exercise.values.first.length,
                      itemBuilder: (context, index) => state
                              .exercise.values.first.values
                              .toList()[index]
                              .contains(':')
                          ? const SizedBox()
                          : Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    context
                                        .read<ActivityCubit>()
                                        .addDropsetExercise(state
                                            .exercise.values.first.values
                                            .toList()[index]);
                                  },
                                  child: ButtonWidget(
                                      !(state.exercise.values.first.values
                                              .toList()[index] ==
                                          state.exerciseDrop),
                                      state.exercise.values.first.values
                                          .toList()[index]),
                                ),
                                const SizedBox(
                                  height: AppDimens.dimens_15,
                                )
                              ],
                            )),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BlocBuilder<ActivityCubit, ActivityState>(
        builder: (context, state) {
          return BottomNavigationBarWidget(() {
            context.read<ActivityCubit>().addDropsetExerciseMap();

            context.read<ChangePageCubit>().changePage(2);
          }, state.exerciseDrop != '', 'Xong');
        },
      ),
    );
  }
}
