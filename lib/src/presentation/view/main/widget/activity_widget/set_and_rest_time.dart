import 'package:fitness_nutrition/src/config/route/route_generator_route.dart';
import 'package:fitness_nutrition/src/core/resource/app_another.dart';
import 'package:fitness_nutrition/src/core/resource/app_string.dart';
import 'package:fitness_nutrition/src/domain/entities/activity.dart';
import 'package:fitness_nutrition/src/presentation/view/main/cubit/activity_cubit/activity_cubit.dart';
import 'package:fitness_nutrition/src/presentation/view/main/cubit/change_page_cubit/change_page_cubit.dart';
import 'package:fitness_nutrition/src/presentation/view/main/widget/activity_widget/field_another_method.dart';
import 'package:fitness_nutrition/src/presentation/view/main/widget/activity_widget/field_cardio_method.dart';
import 'package:fitness_nutrition/src/presentation/view/schedule/cubit/exercsie_cubit/exericse_cubit.dart';
import 'package:fitness_nutrition/src/presentation/view/schedule/cubit/muscle_group/muscle_group_cubit.dart';
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
import '../../../schedule/cubit/schedule_screen_cubit/schedule_screen_cubit.dart';

class SetAndRestTime extends StatelessWidget {
  const SetAndRestTime({super.key});

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
              return Row(
                children: [
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
                        context.read<MuscleGroupCubit>().resetMuscleGroup();

                        context
                            .read<ScheduleScreenMainCubit>()
                            .setCardioMethod('');
                        context
                            .read<ScheduleScreenMainCubit>()
                            .setHiitMethod('');
                        context
                            .read<ScheduleScreenMainCubit>()
                            .changeChooseExercise(false);
                        context.read<ExericseCubit>().resetData();
                        context.read<ActivityCubit>().resetAll();
                        getList(
                                state.allWorkoutSchedulel,
                                listDateTime.indexWhere(
                                  (element) =>
                                      DateFormat('E').format(DateTime.now()) ==
                                      DateFormat('E').format(element),
                                )).isNotEmpty
                            ? context.read<ChangePageCubit>().changePage(0)
                            : context.read<ChangePageCubit>().changePage(1);
                      })
                ],
              );
            }),
            const SizedBox(
              height: AppDimens.dimens_16,
            ),
            Expanded(
                child: Form(
              key: AppAnother.setAndRestTimeKey,
              child: BlocBuilder<ActivityCubit, ActivityState>(
                  builder: (context, state) =>
                      state.exercise.keys.first == AppString.cardio
                          ? FieldCardioMethod(state.exercise)
                          : FieldAnotherMethod(state.exercise)),
            ))
          ],
        ),
      ),
      bottomNavigationBar: BlocBuilder<ActivityCubit, ActivityState>(
        builder: (context, state) {
          return BottomNavigationBarWidget(() {
            final bool isValid =
                AppAnother.setAndRestTimeKey.currentState!.validate();
            if (isValid) {
              final Activity activity = Activity(
                  exercise: state.exercise,
                  set: state.set,
                  restTime: state.restTime,
                  restDrop: state.restDrop,
                  setDrop: state.setDrop,
                  time: state.time);
              Navigator.of(context)
                  .pushNamed(RouteGenerator.actionScreen, arguments: activity)
                  .then((value) {
                // context.read<ActivityCubit>().resetAll();
                // context.read<ChangePageCubit>().changePage(0);
              });
            }
          }, true, 'Xong');
        },
      ),
    );
  }
}

String? textError(String value, String hint, int number) {
  if (value.isEmpty) {
    return 'Vui lòng nhập $hint';
  } else if (value.contains(' ') || value.contains('.')) {
    return 'Vui lòng nhập số tự nhiên lớn hơn hoặc bằng $number';
  } else if (int.parse(value) < number &&
      (hint == 'rest drop' ? int.parse(value) > 10 : true)) {
    return hint == 'rest drop'
        ? 'Please enter ranges from 3 to 10'
        : 'Please enter bigger than $number';
  } else {
    return null;
  }
}
