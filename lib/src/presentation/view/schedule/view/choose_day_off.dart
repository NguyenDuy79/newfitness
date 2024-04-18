import 'package:fitness_nutrition/src/core/resource/app_another.dart';
import 'package:fitness_nutrition/src/core/resource/app_dimens.dart';
import 'package:fitness_nutrition/src/core/resource/app_fonts.dart';
import 'package:fitness_nutrition/src/core/resource/app_string.dart';
import 'package:fitness_nutrition/src/presentation/bloc/infomation_cubit/infomation_cubit.dart';
import 'package:fitness_nutrition/src/presentation/view/schedule/cubit/schedule_screen_cubit/schedule_screen_cubit.dart';
import 'package:fitness_nutrition/src/presentation/widget/global/back_button.dart';
import 'package:fitness_nutrition/src/presentation/widget/global/bottom_navigation_bar.dart';
import 'package:fitness_nutrition/src/presentation/widget/global/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChooseDayOff extends StatelessWidget {
  const ChooseDayOff(this.controller, {super.key});
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
              BackButtonWidget(() {
                Navigator.of(context).pop();
              }),
              const SizedBox(
                height: AppDimens.dimens_16,
              ),
              const Center(
                child: Text(
                  'Chọn ngày nghỉ của bạn',
                  style: TextStyle(
                      fontSize: AppDimens.dimens_24,
                      fontWeight: AppFont.semiBold),
                ),
              ),
              const SizedBox(
                height: AppDimens.dimens_20,
              ),
              Container(
                alignment: Alignment.center,
                height: AppDimens.dimens_60 * 7,
                child: ListView.builder(
                    itemCount: AppAnother.listDayOfWeek.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => BlocBuilder<
                            ScheduleScreenMainCubit, ScheduleScreenMainState>(
                          builder: (context, state) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: AppDimens.dimens_10,
                                  vertical: AppDimens.dimens_5),
                              child:
                                  BlocBuilder<InfomationCubit, InfomationState>(
                                builder: (context, stateInfo) {
                                  return GestureDetector(
                                      onTap: () {
                                        chooseDayOff(
                                            context,
                                            index,
                                            stateInfo.listInfomation.last
                                                .dayTraining);
                                      },
                                      child: ButtonWidget(
                                          state.allDay.contains(
                                              AppAnother.listDayOfWeek[index]),
                                          AppAnother.listDayOfWeek[index]));
                                },
                              ),
                            );
                          },
                        )),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BlocBuilder<InfomationCubit, InfomationState>(
        builder: (context, stateInfo) {
          return BlocBuilder<ScheduleScreenMainCubit, ScheduleScreenMainState>(
            builder: (context, state) {
              return BottomNavigationBarWidget(() {
                controller.animateToPage(1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.linear);
              },
                  checkSubmit(
                    state.allDay.length,
                    stateInfo.listInfomation.last.dayTraining,
                  ),
                  AppString.continues);
            },
          );
        },
      ),
    );
  }
}

bool checkSubmit(int length, String dayTraining) {
  switch (dayTraining) {
    case AppString.dayTraining1:
      if (length > 0) {
        return false;
      } else {
        return true;
      }
    case AppString.dayTraining2:
      if (length > 2) {
        return false;
      } else {
        return true;
      }
    case AppString.dayTraining3:
      if (length > 5) {
        return false;
      } else {
        return true;
      }
    case AppString.dayTraining4:
      if (length > 7) {
        return false;
      } else {
        return true;
      }
    default:
      if (length > 7) {
        return false;
      } else {
        return true;
      }
  }
}

void chooseDayOff(BuildContext context, int index, dayTraining) {
  switch (dayTraining) {
    case AppString.dayTraining1:
      context
          .read<ScheduleScreenMainCubit>()
          .addDayOff(AppAnother.listDayOfWeek[index], 0);
    case AppString.dayTraining2:
      context
          .read<ScheduleScreenMainCubit>()
          .addDayOff(AppAnother.listDayOfWeek[index], 1);
    case AppString.dayTraining3:
      context
          .read<ScheduleScreenMainCubit>()
          .addDayOff(AppAnother.listDayOfWeek[index], 3);
    case AppString.dayTraining4:
      context
          .read<ScheduleScreenMainCubit>()
          .addDayOff(AppAnother.listDayOfWeek[index], 6);
    default:
      context
          .read<ScheduleScreenMainCubit>()
          .addDayOff(AppAnother.listDayOfWeek[index], 7);
  }
}
