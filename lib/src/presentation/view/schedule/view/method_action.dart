import 'package:fitness_nutrition/src/core/funtions/get_list_method.dart';
import 'package:fitness_nutrition/src/core/resource/app_another.dart';
import 'package:fitness_nutrition/src/presentation/view/schedule/cubit/exercsie_cubit/exericse_cubit.dart';
import 'package:fitness_nutrition/src/presentation/widget/global/button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resource/app_colors.dart';
import '../../../../core/resource/app_dimens.dart';
import '../../../../core/resource/app_fonts.dart';
import '../../../../core/resource/app_string.dart';
import '../../../widget/global/back_button.dart';
import '../../../widget/global/bottom_navigation_bar.dart';
import '../cubit/schedule_screen_cubit/schedule_screen_cubit.dart';

class MethodAction extends StatelessWidget {
  const MethodAction(this.controller, {super.key});
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
                      context
                          .read<ScheduleScreenMainCubit>()
                          .resetListMethods();
                      controller.animateToPage(2,
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
                          context
                              .read<ScheduleScreenMainCubit>()
                              .deleteAllMethod();
                          controller.animateToPage(1,
                              duration: const Duration(microseconds: 300),
                              curve: Curves.linear);
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
                      List<Map<String, Map<String, String>>> listMethod =
                          getListMethod(state);
                      return ListView.builder(
                          itemCount: listMethod.length,
                          itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: AppDimens.dimens_10,
                                  vertical: AppDimens.dimens_5),
                              child: GestureDetector(
                                  onTap: () {
                                    clickButton(
                                        context, index, controller, listMethod);
                                  },
                                  child: ButtonWidget(!checkEmpty(state, index),
                                      listMethod[index].keys.first))));
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
            return BottomNavigationBarWidget(() {
              controller.animateToPage(1,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.linear);
            },
                checkEmptyAll(
                  state,
                ),
                'Xong');
          },
        ));
  }
}

void clickButton(BuildContext context, int index, PageController controller,
    List<Map<String, Map<String, String>>> listMethod) {
  context.read<ScheduleScreenMainCubit>().upCountMethod(index);

  if (listMethod[index].values.first.isNotEmpty) {
    if (listMethod[index].keys.first == AppString.cardio) {
      context
          .read<ScheduleScreenMainCubit>()
          .setCardioMethod(listMethod[index].values.first['cardioMethod']!);
      if (listMethod[index].values.first['hiitMethod'] != null) {
        context
            .read<ScheduleScreenMainCubit>()
            .setHiitMethod(listMethod[index].values.first['hiitMethod']!);
      }
      if (!AppAnother.lissCardioExercise
          .contains(listMethod[index].values.first.values.toList()[1])) {
        context.read<ScheduleScreenMainCubit>().changeChooseExercise(true);
      }
      if (listMethod[index].values.first.keys.toList().last.contains('.')) {
        context.read<ExericseCubit>().setData(
            listMethod[index].values.first,
            int.parse(listMethod[index]
                .values
                .first
                .keys
                .toList()
                .last
                .split('.')[0]),
            int.parse(listMethod[index]
                .values
                .first
                .keys
                .toList()
                .last
                .split('.')[0]));
      } else {
        context
            .read<ExericseCubit>()
            .setData(listMethod[index].values.first, 1, 0);
      }
    } else {
      context
          .read<ExericseCubit>()
          .setData(listMethod[index].values.first, 1, 0);
    }
  }
  switch (listMethod[index].keys.first) {
    case AppString.inTheGym:
      controller.animateToPage(4,
          duration: const Duration(microseconds: 200), curve: Curves.linear);
    case AppString.calisthenics:
      controller.animateToPage(5,
          duration: const Duration(microseconds: 200), curve: Curves.linear);
    default:
      controller.animateToPage(6,
          duration: const Duration(microseconds: 200), curve: Curves.linear);
  }
}

bool checkEmpty(ScheduleScreenMainState state, int index) {
  switch (state.allDay[state.countDay]) {
    case AppString.monday:
      if (state.mon[index].values.first.isEmpty) {
        return false;
      } else {
        return true;
      }
    case AppString.tuesday:
      if (state.tue[index].values.first.isEmpty) {
        return false;
      } else {
        return true;
      }
    case AppString.wednesday:
      if (state.wed[index].values.first.isEmpty) {
        return false;
      } else {
        return true;
      }
    case AppString.thursday:
      if (state.thu[index].values.first.isEmpty) {
        return false;
      } else {
        return true;
      }
    case AppString.friday:
      if (state.fri[index].values.first.isEmpty) {
        return false;
      } else {
        return true;
      }
    case AppString.saturday:
      if (state.sat[index].values.first.isEmpty) {
        return false;
      } else {
        return true;
      }
    default:
      if (state.sun[index].values.first.isEmpty) {
        return false;
      } else {
        return true;
      }
  }
}

bool checkEmptyAll(
  ScheduleScreenMainState state,
) {
  switch (state.allDay[state.countDay]) {
    case AppString.monday:
      for (Map<String, Map<String, String>> item in state.mon) {
        if (item.values.first.isEmpty) {
          return false;
        }
      }

    case AppString.tuesday:
      for (Map<String, Map<String, String>> item in state.tue) {
        if (item.values.first.isEmpty) {
          return false;
        }
      }

    case AppString.wednesday:
      for (Map<String, Map<String, String>> item in state.wed) {
        if (item.values.first.isEmpty) {
          return false;
        }
      }

    case AppString.thursday:
      for (Map<String, Map<String, String>> item in state.thu) {
        if (item.values.first.isEmpty) {
          return false;
        }
      }

    case AppString.friday:
      for (Map<String, Map<String, String>> item in state.fri) {
        if (item.values.first.isEmpty) {
          return false;
        }
      }

    case AppString.saturday:
      for (Map<String, Map<String, String>> item in state.sat) {
        if (item.values.first.isEmpty) {
          return false;
        }
      }

    default:
      for (Map<String, Map<String, String>> item in state.sun) {
        if (item.values.first.isEmpty) {
          return false;
        }
      }
  }
  return true;
}
