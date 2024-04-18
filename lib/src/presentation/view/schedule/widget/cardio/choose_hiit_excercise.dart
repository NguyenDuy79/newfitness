import 'package:fitness_nutrition/src/core/resource/app_string.dart';
import 'package:fitness_nutrition/src/presentation/view/schedule/cubit/exercsie_cubit/exericse_cubit.dart';

import 'package:fitness_nutrition/src/presentation/view/schedule/cubit/schedule_screen_cubit/schedule_screen_cubit.dart';
import 'package:fitness_nutrition/src/presentation/view/schedule/view/cardio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/resource/app_another.dart';
import '../../../../../core/resource/app_colors.dart';
import '../../../../../core/resource/app_dimens.dart';
import '../../../../widget/global/bottom_navigation_bar.dart';

class ChooseHiitExercise extends StatelessWidget {
  const ChooseHiitExercise(this.controller, {super.key});
  final PageController? controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                SizedBox(
                  width: AppDimens.dimens_20,
                ),
                Text(
                  'Chọn các bài tập cardio',
                ),
              ],
            ),
            BlocBuilder<ScheduleScreenMainCubit, ScheduleScreenMainState>(
                builder: (context, state) {
              return (state.hiitMethod == AppString.group)
                  ? Padding(
                      padding: const EdgeInsets.only(left: AppDimens.dimens_20),
                      child: BlocBuilder<ExericseCubit, ExericseState>(
                        builder: (context, stateExer) {
                          return Text(
                            'Level: ${stateExer.hiitCurrentLevel}',
                          );
                        },
                      ),
                    )
                  : const SizedBox();
            }),
            SizedBox(
              height:
                  AppAnother.cardioExerciseShare.length * AppDimens.dimens_35,
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: AppAnother.cardioExerciseShare.length,
                  itemBuilder: (context, indexExercise) {
                    return BlocBuilder<ExericseCubit, ExericseState>(
                      builder: (context, state) {
                        return BlocBuilder<ScheduleScreenMainCubit,
                            ScheduleScreenMainState>(
                          builder: (context, stateSche) {
                            int curentExcercise = stateSche.hiitMethod ==
                                    AppString.group
                                ? listCurrentLevel(
                                        state.map, state.hiitCurrentLevel)
                                    .indexWhere((element) =>
                                        element ==
                                        AppAnother
                                            .cardioExerciseShare[indexExercise])
                                : (state.map.values.toList()).indexWhere(
                                        (element) =>
                                            element ==
                                            AppAnother.cardioExerciseShare[
                                                indexExercise]) -
                                    (stateSche.cardioMethod ==
                                            AppString.lissCardio
                                        ? 1
                                        : 2);
                            return GestureDetector(
                                onTap: () {
                                  if (stateSche.hiitMethod == '' ||
                                      stateSche.hiitMethod ==
                                          AppString.sequentially) {
                                    context
                                        .read<ExericseCubit>()
                                        .addAndRemoveExerciseCardioAnother(
                                            AppAnother.cardioExerciseShare[
                                                indexExercise],
                                            stateSche.cardioMethod,
                                            stateSche.hiitMethod);
                                  } else {
                                    context
                                        .read<ExericseCubit>()
                                        .addAndRemoveExerciseCardioGroup(
                                            AppAnother.cardioExerciseShare[
                                                indexExercise]);
                                  }
                                },
                                child: Container(
                                  height: AppDimens.dimens_35,
                                  width: double.infinity,
                                  padding: const EdgeInsets.only(
                                      left: AppDimens.dimens_2,
                                      right: AppDimens.dimens_10,
                                      bottom: AppDimens.dimens_2,
                                      top: AppDimens.dimens_2),
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: AppDimens.dimens_5,
                                      ),
                                      if (curentExcercise >= 0)
                                        Container(
                                          alignment: Alignment.center,
                                          width: AppDimens.dimens_40,
                                          child: Text(
                                            (curentExcercise + 1).toString(),
                                            style: const TextStyle(
                                                color: AppColor.black),
                                          ),
                                        ),
                                      if (curentExcercise < 0)
                                        SizedBox(
                                          width: AppDimens.dimens_40,
                                          child: Text(
                                            (curentExcercise + 1).toString(),
                                            style: const TextStyle(
                                                color: AppColor.white),
                                          ),
                                        ),
                                      const SizedBox(
                                        height: AppDimens.dimens_8,
                                      ),
                                      Flexible(
                                        child: Text(
                                          AppAnother.cardioExerciseShare[
                                              indexExercise],
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ));
                          },
                        );
                      },
                    );
                  }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BlocBuilder<ExericseCubit, ExericseState>(
        builder: (context, state) {
          return BlocBuilder<ScheduleScreenMainCubit, ScheduleScreenMainState>(
            builder: (context, stateSche) {
              return BottomNavigationBarWidget(() {
                addCardioExercise(context, controller, state, stateSche);
              },
                  stateSche.hiitMethod == AppString.group
                      ? listCurrentLevel(state.map, state.hiitCurrentLevel)
                          .isNotEmpty
                      : state.map.isNotEmpty,
                  'Xong');
            },
          );
        },
      ),
    );
  }
}

List<String> listCurrentLevel(Map<String, String> map, int currentLevel) {
  List<String> result = [];
  for (String item in map.keys.toList()) {
    if (item.split('.')[0] == currentLevel.toString()) {
      result.add(map[item]!);
    }
  }

  return result;
}
