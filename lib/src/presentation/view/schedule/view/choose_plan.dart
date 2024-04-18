import 'package:fitness_nutrition/src/core/resource/app_colors.dart';
import 'package:fitness_nutrition/src/core/resource/app_dimens.dart';
import 'package:fitness_nutrition/src/core/resource/app_fonts.dart';
import 'package:fitness_nutrition/src/presentation/view/schedule/cubit/schedule_screen_cubit/schedule_screen_cubit.dart';
import 'package:fitness_nutrition/src/presentation/widget/global/back_button.dart';
import 'package:fitness_nutrition/src/presentation/widget/global/bottom_navigation_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resource/app_another.dart';
import '../../../../core/resource/app_string.dart';

class ChoosePlans extends StatelessWidget {
  const ChoosePlans(this.controller, {super.key});
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppDimens.dimens_24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BackButtonWidget(() {
              context.read<ScheduleScreenMainCubit>().deleteAllMethod();
              controller.animateToPage(1,
                  duration: const Duration(microseconds: 1000),
                  curve: Curves.linear);
            }),
            const SizedBox(
              height: AppDimens.dimens_16,
            ),
            BlocBuilder<ScheduleScreenMainCubit, ScheduleScreenMainState>(
              builder: (context, state) {
                return Center(
                  child: Text(
                    state.allDay[state.countDay],
                    style: const TextStyle(
                        fontSize: AppDimens.dimens_24,
                        fontWeight: AppFont.semiBold),
                  ),
                );
              },
            ),
            const SizedBox(
              height: AppDimens.dimens_16,
            ),
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: AppDimens.dimens_10),
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: AppAnother.exerciseMethod.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin:
                            const EdgeInsets.only(bottom: AppDimens.dimens_10),
                        width: double.infinity,
                        height: AppDimens.dimens_50,
                        padding: const EdgeInsets.symmetric(
                            vertical: AppDimens.dimens_5,
                            horizontal: AppDimens.dimens_10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: AppDimens.dimens_10),
                                decoration: BoxDecoration(
                                  color: AppColor.pink.withOpacity(0.85),
                                ),
                                child: Center(
                                  child: Text(
                                    AppAnother.exerciseMethod[index],
                                    style: const TextStyle(
                                        fontSize: AppDimens.dimens_18,
                                        fontWeight: AppFont.semiBold,
                                        color: AppColor.white),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: AppDimens.dimens_10,
                            ),
                            GestureDetector(
                              onTap: () {
                                context
                                    .read<ScheduleScreenMainCubit>()
                                    .addMethods(
                                        AppAnother.exerciseMethod[index]);
                              },
                              child: Container(
                                  height: AppDimens.dimens_40,
                                  width: AppDimens.dimens_40,
                                  decoration: BoxDecoration(
                                      color: AppColor.white,
                                      border: Border.all(
                                          width: AppDimens.dimens_1,
                                          color: AppColor.pink),
                                      shape: BoxShape.circle),
                                  child: const Center(
                                    child: Icon(
                                      Icons.add,
                                      size: AppDimens.dimens_35,
                                    ),
                                  )),
                            ),
                            const SizedBox(
                              width: AppDimens.dimens_8,
                            ),
                            BlocBuilder<ScheduleScreenMainCubit,
                                ScheduleScreenMainState>(
                              builder: (context, state) {
                                return SizedBox(
                                    width: AppDimens.dimens_30,
                                    child: Center(
                                      child: Text(
                                        methodCount(
                                                state,
                                                AppAnother
                                                    .exerciseMethod[index])
                                            .toString(),
                                        style: const TextStyle(
                                            fontSize: AppDimens.dimens_16,
                                            fontWeight: AppFont.medium),
                                      ),
                                    ));
                              },
                            ),
                            const SizedBox(
                              width: AppDimens.dimens_8,
                            ),
                            GestureDetector(
                              onTap: () {
                                context
                                    .read<ScheduleScreenMainCubit>()
                                    .reduceMethods(
                                        AppAnother.exerciseMethod[index]);
                              },
                              child: Container(
                                  height: AppDimens.dimens_40,
                                  width: AppDimens.dimens_40,
                                  decoration: BoxDecoration(
                                      color: AppColor.white,
                                      border: Border.all(
                                          width: AppDimens.dimens_1,
                                          color: AppColor.pink),
                                      shape: BoxShape.circle),
                                  child: const Center(
                                    child: Icon(
                                      Icons.remove,
                                      size: AppDimens.dimens_35,
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar:
          BlocBuilder<ScheduleScreenMainCubit, ScheduleScreenMainState>(
        builder: (context, state) {
          return BottomNavigationBarWidget(() {
            controller.animateToPage(3,
                duration: const Duration(microseconds: 100),
                curve: Curves.linear);
          }, checkEmpty(state), 'Xong');
        },
      ),
    );
  }
}

int methodCountOffDay(
    List<Map<String, Map<String, String>>> map, String method) {
  int result = 0;
  for (Map<String, Map<String, String>> item in map) {
    if (item.keys.first == method) {
      result++;
    }
  }
  return result;
}

int methodCount(ScheduleScreenMainState state, String method) {
  switch (state.allDay[state.countDay]) {
    case AppString.monday:
      return methodCountOffDay(state.mon, method);
    case AppString.tuesday:
      return methodCountOffDay(state.tue, method);
    case AppString.wednesday:
      return methodCountOffDay(state.wed, method);
    case AppString.thursday:
      return methodCountOffDay(state.thu, method);
    case AppString.friday:
      return methodCountOffDay(state.fri, method);
    case AppString.saturday:
      return methodCountOffDay(state.sat, method);
    default:
      return methodCountOffDay(state.sun, method);
  }
}

bool checkEmpty(ScheduleScreenMainState state) {
  switch (state.allDay[state.countDay]) {
    case AppString.monday:
      return state.mon.isNotEmpty;
    case AppString.tuesday:
      return state.tue.isNotEmpty;
    case AppString.wednesday:
      return state.wed.isNotEmpty;
    case AppString.thursday:
      return state.thu.isNotEmpty;
    case AppString.friday:
      return state.fri.isNotEmpty;
    case AppString.saturday:
      return state.sat.isNotEmpty;
    default:
      return state.sun.isNotEmpty;
  }
}
