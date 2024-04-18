import 'package:fitness_nutrition/src/presentation/bloc/schedule_cubit/schedule_cubit.dart';
import 'package:fitness_nutrition/src/presentation/view/main/cubit/change_page_cubit/change_page_cubit.dart';
import 'package:fitness_nutrition/src/presentation/view/main/cubit/schedule_screen_cubit/schedule_screen_cubit.dart';
import 'package:fitness_nutrition/src/presentation/view/main/widget/main_widget/main_bottom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../../config/route/route_generator_route.dart';
import '../../../../core/funtions/day_of_week.dart';
import '../../../../core/funtions/get_list_method.dart';
import '../../../../core/resource/app_colors.dart';
import '../../../../core/resource/app_dimens.dart';
import '../cubit/extend_exercise_method/extend_exercise_method_cubit.dart';
import '../cubit/main_page_cubit/main_page_index_cubit.dart';
import '../cubit/nutrition_screen/nutrition_screen_cubit_cubit.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocBuilder<MainPageIndexCubit, int>(
          builder: (context, state) {
            List<DateTime> listDateTime = getWeek(DateTime.now());
            return Stack(
              children: [
                RouteGenerator.listPage[state],
                SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: Column(
                    children: [
                      const Expanded(child: SizedBox()),
                      Container(
                          color: AppColor.grey1,
                          width: double.infinity,
                          height: AppDimens.dimens_105,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              MainBottomWidget(state, () {
                                context
                                    .read<MainPageIndexCubit>()
                                    .changePage(0);
                              }, 'Home', Icons.home_max_outlined, 0),
                              MainBottomWidget(state, () {
                                context
                                    .read<MainPageIndexCubit>()
                                    .changePage(1);
                                context
                                    .read<NutritionScreenCubit>()
                                    .getTrueValue(listDateTime.indexWhere(
                                      (element) =>
                                          DateFormat('E')
                                              .format(DateTime.now()) ==
                                          DateFormat('E').format(element),
                                    ));
                              }, 'Nutri', Icons.fastfood_outlined, 1),
                              BlocBuilder<ScheduleCubit, ScheduleState>(
                                builder: (context, state) {
                                  return GestureDetector(
                                    onTap: () {
                                      if (getList(
                                          state.allWorkoutSchedulel,
                                          listDateTime.indexWhere(
                                            (element) =>
                                                DateFormat('E')
                                                    .format(DateTime.now()) ==
                                                DateFormat('E').format(element),
                                          )).isNotEmpty) {
                                        context
                                            .read<ChangePageCubit>()
                                            .changePage(0);
                                      } else {
                                        context
                                            .read<ChangePageCubit>()
                                            .changePage(1);
                                      }

                                      context
                                          .read<MainPageIndexCubit>()
                                          .changePage(2);
                                    },
                                    child: Container(
                                      height: AppDimens.dimens_105,
                                      alignment: Alignment.topCenter,
                                      width: AppDimens.dimens_60,
                                      child: Container(
                                        height: AppDimens.dimens_65,
                                        width: double.infinity,
                                        decoration: const BoxDecoration(
                                            color: AppColor.black,
                                            shape: BoxShape.circle),
                                        child: const Icon(
                                          Icons.play_arrow,
                                          size: AppDimens.dimens_24,
                                          color: AppColor.white,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              BlocBuilder<ScheduleCubit, ScheduleState>(
                                builder: (context, stateSche) {
                                  return MainBottomWidget(state, () {
                                    context
                                        .read<MainPageIndexCubit>()
                                        .changePage(3);

                                    if (getList(
                                            stateSche.allWorkoutSchedulel,
                                            listDateTime.indexWhere(
                                              (element) =>
                                                  DateFormat('E')
                                                      .format(DateTime.now()) ==
                                                  DateFormat('E')
                                                      .format(element),
                                            )).length ==
                                        1) {
                                      context
                                          .read<ExtendExerciseMethodCubit>()
                                          .addZero();
                                    }
                                    context
                                        .read<ScheduleScreenCubit>()
                                        .changePage(listDateTime.indexWhere(
                                          (element) =>
                                              DateFormat('E')
                                                  .format(DateTime.now()) ==
                                              DateFormat('E').format(element),
                                        ));
                                  }, 'Plan', Icons.calendar_month_outlined, 3);
                                },
                              ),
                              MainBottomWidget(state, () {
                                context
                                    .read<MainPageIndexCubit>()
                                    .changePage(4);
                              }, 'More', Icons.more_horiz, 4),
                            ],
                          )),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
