import 'package:fitness_nutrition/src/presentation/view/main/cubit/extend_exercise_method/extend_exercise_method_cubit.dart';
import 'package:fitness_nutrition/src/presentation/view/main/cubit/schedule_screen_cubit/schedule_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../core/resource/app_colors.dart';
import '../../../../../core/resource/app_dimens.dart';
import '../../../../../core/resource/app_fonts.dart';
import '../../cubit/nutrition_screen/nutrition_screen_cubit_cubit.dart';

class CalendarItemWidget extends StatelessWidget {
  CalendarItemWidget(this.sizeScreen, this.dateTime, this.choose, this.index,
      this.calories, this.nutri, this.checkSingle,
      {super.key});
  final Size sizeScreen;
  final DateTime dateTime;
  final bool choose;
  final int index;
  final bool calories;
  final bool nutri;
  final bool checkSingle;
  final DateTime dateTimeNow =
      DateTime.parse(DateFormat('yyyyMMdd').format(DateTime.now()));
  @override
  Widget build(BuildContext context) {
    final bool checkDay = dateTimeNow.difference(dateTime).inDays >= 0;
    return GestureDetector(
      onTap: () {
        if (nutri) {
          if (checkDay) {
            context.read<NutritionScreenCubit>().getTrueValue(index);
          }
        } else {
          context.read<ScheduleScreenCubit>().changePage(index);
          if (checkSingle) {
            context.read<ExtendExerciseMethodCubit>().addZero();
          } else {
            context.read<ExtendExerciseMethodCubit>().resetIndex();
          }
        }
      },
      child: Container(
        height: (sizeScreen.width - AppDimens.dimens_24 * 2) / 7,
        width: (sizeScreen.width - AppDimens.dimens_24 * 2) / 7 -
            AppDimens.dimens_8,
        decoration: BoxDecoration(
            color:
                (nutri ? (dateTimeNow.difference(dateTime).inDays >= 0) : true)
                    ? choose
                        ? calories
                            ? AppColor.pink
                            : AppColor.blue
                        : AppColor.white
                    : AppColor.grey,
            borderRadius: BorderRadius.circular(AppDimens.dimens_12),
            border: Border.all(
                width: AppDimens.dimens_1,
                color: calories ? AppColor.pink : AppColor.blue)),
        child: FittedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                DateFormat('dd').format(dateTime),
                style: TextStyle(
                    fontSize: AppDimens.dimens_14,
                    color: choose
                        ? AppColor.white
                        : (nutri
                                ? dateTimeNow.difference(dateTime).inDays >= 0
                                : true)
                            ? AppColor.black
                            : AppColor.white),
              ),
              Text(
                dayOfWeek(DateFormat('EEE').format(dateTime)),
                style: TextStyle(
                    fontSize: AppDimens.dimens_18,
                    fontWeight: AppFont.semiBold,
                    color: choose
                        ? AppColor.white
                        : (nutri
                                ? (dateTimeNow.difference(dateTime).inDays >= 0)
                                : true)
                            ? AppColor.black
                            : AppColor.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}

String dayOfWeek(String day) {
  String result = '';
  switch (day) {
    case 'Mon':
      result = 'T2';
    case 'Tue':
      result = 'T3';
    case 'Wed':
      result = 'T4';
    case 'Thu':
      result = 'T5';
    case 'Fri':
      result = 'T6';
    case 'Sat':
      result = 'T7';
    default:
      result = 'CN';
  }
  return result;
}
