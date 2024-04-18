import 'package:fitness_nutrition/src/presentation/view/main/cubit/change_page_cubit/change_page_cubit.dart';
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
import '../../../../widget/global/bottom_navigation_bar.dart';
import '../../../schedule/cubit/exercsie_cubit/exericse_cubit.dart';
import '../../../schedule/cubit/muscle_group/muscle_group_cubit.dart';
import '../../cubit/activity_cubit/activity_cubit.dart';

class SortAllExercise extends StatelessWidget {
  const SortAllExercise({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppDimens.dimens_24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            Expanded(
              child: BlocBuilder<ActivityCubit, ActivityState>(
                builder: (context, state) {
                  return ListView.builder(
                      itemCount: state.exercise.values.first.values.length,
                      itemBuilder: (context, index) {
                        int itemInSort = state.sortData.indexWhere(
                          (element) =>
                              element ==
                              state.exercise.values.first.values
                                  .toList()[index],
                        );
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                context.read<ActivityCubit>().addSortList(state
                                    .exercise.values.first.values
                                    .toList()[index]);
                              },
                              child: Container(
                                height: AppDimens.dimens_45,
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: AppDimens.dimens_10,
                                    vertical: AppDimens.dimens_2),
                                decoration: BoxDecoration(
                                  color: AppColor.white,
                                  border: Border.all(
                                      width: AppDimens.dimens_1,
                                      color: AppColor.pink),
                                ),
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: itemInSort >= 0
                                      ? MainAxisAlignment.start
                                      : MainAxisAlignment.center,
                                  children: [
                                    if (itemInSort >= 0)
                                      SizedBox(
                                        width: AppDimens.dimens_20,
                                        child: Text(
                                          (itemInSort + 1).toString(),
                                          style: const TextStyle(
                                            fontSize: AppDimens.dimens_20,
                                            fontWeight: AppFont.medium,
                                          ),
                                        ),
                                      ),
                                    Expanded(
                                      child: Center(
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
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: AppDimens.dimens_15,
                            )
                          ],
                        );
                      });
                },
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BlocBuilder<ActivityCubit, ActivityState>(
        builder: (context, state) {
          return BottomNavigationBarWidget(() {
            context.read<ActivityCubit>().sortDone();
            context.read<ChangePageCubit>().changePage(2);
          }, state.sortData.length == state.exercise.values.first.length,
              'Xong');
        },
      ),
    );
  }
}
