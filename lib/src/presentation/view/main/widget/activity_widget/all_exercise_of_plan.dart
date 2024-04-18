import 'package:fitness_nutrition/src/core/resource/app_dimens.dart';
import 'package:fitness_nutrition/src/presentation/view/main/cubit/activity_cubit/activity_cubit.dart';
import 'package:fitness_nutrition/src/presentation/view/main/cubit/change_page_cubit/change_page_cubit.dart';
import 'package:fitness_nutrition/src/presentation/view/schedule/widget/cardio/cardio_button_widget.dart';
import 'package:fitness_nutrition/src/presentation/widget/global/bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

import '../../../../../core/funtions/day_of_week.dart';
import '../../../../../core/funtions/get_list_method.dart';
import '../../../../../core/resource/app_colors.dart';
import '../../../../../core/resource/app_fonts.dart';
import '../../../../bloc/schedule_cubit/schedule_cubit.dart';
import '../../../../widget/global/back_button.dart';
import '../../../schedule/cubit/exercsie_cubit/exericse_cubit.dart';
import '../../../schedule/cubit/muscle_group/muscle_group_cubit.dart';

class AllExerciseOfPlan extends StatelessWidget {
  const AllExerciseOfPlan({super.key});

  @override
  Widget build(BuildContext context) {
    final List<DateTime> listDateTime = getWeek(DateTime.now());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppDimens.dimens_24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<ScheduleCubit, ScheduleState>(
                builder: (context, state) {
              return Row(children: [
                BlocBuilder<ActivityCubit, ActivityState>(
                  builder: (context, stateActi) {
                    return BackButtonWidget(() {
                      if (stateActi.methodExercise == '' &&
                          getList(
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
                    });
                  },
                ),
                const Expanded(child: SizedBox()),
                CupertinoButton(
                  child: Text(
                    'Thoát',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: AppFont.semiBold,
                        color: AppColor.blue.withOpacity(0.8)),
                  ),
                  onPressed: () {
                    context.read<ActivityCubit>().resetAll();
                    context.read<MuscleGroupCubit>().resetMuscleGroup();
                    context.read<ExericseCubit>().resetData();

                    getList(
                            state.allWorkoutSchedulel,
                            listDateTime.indexWhere(
                              (element) =>
                                  DateFormat('E').format(DateTime.now()) ==
                                  DateFormat('E').format(element),
                            )).isNotEmpty
                        ? context.read<ChangePageCubit>().changePage(0)
                        : context.read<ChangePageCubit>().changePage(1);
                  },
                )
              ]);
            }),
            const SizedBox(
              height: AppDimens.dimens_16,
            ),
            GestureDetector(
              onTap: () {
                context.read<ChangePageCubit>().changePage(3);
              },
              child: const CardioButtonWidget('Dropset'),
            ),
            const SizedBox(
              height: AppDimens.dimens_16,
            ),
            GestureDetector(
              onTap: () {
                context.read<ChangePageCubit>().changePage(4);
              },
              child: const CardioButtonWidget('Superset'),
            ),
            const SizedBox(
              height: AppDimens.dimens_16,
            ),
            CupertinoButton(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppDimens.dimens_10,
                    vertical: AppDimens.dimens_5),
                child: const Text(
                  'Nhấn để sắp xếp lại',
                  style: TextStyle(
                      color: AppColor.pink,
                      fontSize: AppDimens.dimens_18,
                      fontWeight: AppFont.semiBold),
                ),
                onPressed: () {
                  context.read<ChangePageCubit>().changePage(5);
                }),
            const SizedBox(
              height: AppDimens.dimens_16,
            ),
            Expanded(
              child: BlocBuilder<ActivityCubit, ActivityState>(
                builder: (context, state) {
                  return ListView.builder(
                    itemCount: state.exercise.values.first.values.length,
                    itemBuilder: (context, index) => Column(
                      children: [
                        Slidable(
                          key: ValueKey(index),
                          startActionPane: !state.exercise.values.first.values
                                  .toList()[index]
                                  .contains(':')
                              ? null
                              : ActionPane(
                                  extentRatio: 0.2,
                                  motion: const ScrollMotion(),
                                  children: [
                                      SlidableAction(
                                        onPressed:
                                            (BuildContext context) async {
                                          if (state.exercise.values.first.values
                                              .toList()[index]
                                              .contains('Dropset')) {
                                            context
                                                .read<ActivityCubit>()
                                                .deleteDrop(index);
                                          } else {
                                            context
                                                .read<ActivityCubit>()
                                                .deleteSuperset(index);
                                          }
                                        },
                                        backgroundColor: AppColor.grey1,
                                        foregroundColor: AppColor.blue,
                                        icon: Icons.remove_circle_outline,
                                      )
                                    ]),
                          endActionPane: ActionPane(
                              extentRatio: 0.2,
                              motion: const ScrollMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (BuildContext context) async {
                                    context
                                        .read<ActivityCubit>()
                                        .deleteExercise(index);
                                  },
                                  backgroundColor: AppColor.grey1,
                                  foregroundColor: AppColor.red,
                                  icon: Icons.delete,
                                )
                              ]),
                          child: Container(
                            height: AppDimens.dimens_45,
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppDimens.dimens_5,
                                vertical: AppDimens.dimens_2),
                            decoration: BoxDecoration(
                              color: AppColor.white,
                              border: Border.all(
                                  width: AppDimens.dimens_1,
                                  color: AppColor.pink),
                            ),
                            alignment: Alignment.center,
                            child: FittedBox(
                              child: Text(
                                state.exercise.values.first.values
                                    .toList()[index],
                                style: const TextStyle(
                                  fontSize: AppDimens.dimens_20,
                                  fontWeight: AppFont.medium,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: AppDimens.dimens_15,
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(() {
        context.read<ChangePageCubit>().changePage(6);
      }, true, 'Xong'),
    );
  }
}
