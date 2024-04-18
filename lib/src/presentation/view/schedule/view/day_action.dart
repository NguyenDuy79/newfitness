import 'dart:async';

import 'package:fitness_nutrition/src/core/resource/app_string.dart';
import 'package:fitness_nutrition/src/domain/entities/workout_schedule.dart';
import 'package:fitness_nutrition/src/presentation/bloc/schedule_cubit/schedule_cubit.dart';
import 'package:fitness_nutrition/src/presentation/view/main/widget/plan_widget/modal_popup_schedule_widget.dart';
import 'package:fitness_nutrition/src/presentation/widget/global/button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resource/app_colors.dart';
import '../../../../core/resource/app_dimens.dart';
import '../../../../core/resource/app_fonts.dart';
import '../../../widget/global/back_button.dart';
import '../../../widget/global/bottom_navigation_bar.dart';
import '../cubit/schedule_screen_cubit/schedule_screen_cubit.dart';

class DayAction extends StatelessWidget {
  const DayAction(this.controller, {super.key});
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimens.dimens_24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    BackButtonWidget(() {
                      controller.animateToPage(0,
                          duration: const Duration(microseconds: 300),
                          curve: Curves.linear);
                    }),
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
                          Navigator.of(context).pop();
                        })
                  ],
                ),
                const SizedBox(
                  height: AppDimens.dimens_24,
                ),
                Container(
                  alignment: Alignment.center,
                  height: AppDimens.dimens_60 * 7,
                  child: BlocBuilder<ScheduleScreenMainCubit,
                      ScheduleScreenMainState>(
                    builder: (context, state) {
                      return ListView.builder(
                          itemCount: state.allDay.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: AppDimens.dimens_10,
                                  vertical: AppDimens.dimens_5),
                              child: GestureDetector(
                                  onTap: () {
                                    context
                                        .read<ScheduleScreenMainCubit>()
                                        .changeCountDay(index);
                                    controller.animateToPage(2,
                                        duration:
                                            const Duration(microseconds: 1000),
                                        curve: Curves.linear);
                                  },
                                  child: ButtonWidget(
                                      !checkEmpty(state.allDay[index], state),
                                      state.allDay[index]))));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar:
            BlocBuilder<ScheduleScreenMainCubit, ScheduleScreenMainState>(
          builder: (context, state) {
            return BlocBuilder<ScheduleCubit, ScheduleState>(
              builder: (context, stateSche) {
                return BottomNavigationBarWidget(() async {
                  await addButton(context, state, stateSche);
                }, checkAllEmpty(state), AppString.continues);
              },
            );
          },
        ));
  }
}

Future<void> addButton(BuildContext context, ScheduleScreenMainState state,
    ScheduleState stateSche) async {
  final WorkoutSchedule workoutSchedule = WorkoutSchedule(
      check: true,
      name: '',
      key: 0,
      dateTime: DateTime.now().toString(),
      mon: state.mon,
      tue: state.tue,
      wed: state.wed,
      thu: state.thu,
      fri: state.fri,
      sat: state.sat,
      sun: state.sun);
  List<String> name = allName(stateSche.allWorkoutSchedulel);
  await showCupertinoModalPopup(
      context: context,
      builder: (context) => ModalPopupScheduleWidget(workoutSchedule, name));
}

List<String> allName(List<WorkoutSchedule> list) {
  List<String> result = [];
  for (WorkoutSchedule item in list) {
    result.add(item.name);
  }
  return result;
}

bool checkEmpty(String day, ScheduleScreenMainState state) {
  switch (day) {
    case AppString.monday:
      if (state.mon.isEmpty) {
        return false;
      } else {
        return true;
      }
    case AppString.tuesday:
      if (state.tue.isEmpty) {
        return false;
      } else {
        return true;
      }
    case AppString.wednesday:
      if (state.wed.isEmpty) {
        return false;
      } else {
        return true;
      }
    case AppString.thursday:
      if (state.thu.isEmpty) {
        return false;
      } else {
        return true;
      }
    case AppString.friday:
      if (state.fri.isEmpty) {
        return false;
      } else {
        return true;
      }
    case AppString.saturday:
      if (state.sat.isEmpty) {
        return false;
      } else {
        return true;
      }
    default:
      if (state.sun.isEmpty) {
        return false;
      } else {
        return true;
      }
  }
}

bool checkAllEmpty(ScheduleScreenMainState state) {
  for (String item in state.allDay) {
    switch (item) {
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
  return true;
}
