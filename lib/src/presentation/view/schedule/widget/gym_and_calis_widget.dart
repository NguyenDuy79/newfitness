import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resource/app_colors.dart';
import '../../../../core/resource/app_dimens.dart';
import '../../../../core/resource/app_fonts.dart';
import '../cubit/exercsie_cubit/exericse_cubit.dart';
import '../cubit/muscle_group/muscle_group_cubit.dart';

class GymAndCalisWidget extends StatelessWidget {
  const GymAndCalisWidget(this.muscleGroup, this.exercise, {super.key});
  final List<String> muscleGroup;
  final Map<String, List<String>> exercise;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: muscleGroup.length,
      itemBuilder: (context, index) =>
          BlocBuilder<MuscleGroupCubit, MuscleGroupState>(
        builder: (context, state) {
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  context
                      .read<MuscleGroupCubit>()
                      .addAndRemoveMuscleGroup(muscleGroup[index]);
                },
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: AppDimens.dimens_5),
                  height: AppDimens.dimens_45,
                  decoration: BoxDecoration(
                      color: state.muscleGroup.contains(muscleGroup[index])
                          ? AppColor.pink
                          : AppColor.white,
                      border: Border.all(
                          width: AppDimens.dimens_1, color: AppColor.pink),
                      borderRadius: BorderRadius.circular(AppDimens.dimens_12)),
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimens.dimens_16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        muscleGroup[index],
                        style: TextStyle(
                            fontSize: AppDimens.dimens_18,
                            color:
                                state.muscleGroup.contains(muscleGroup[index])
                                    ? AppColor.white
                                    : AppColor.black,
                            fontWeight: AppFont.semiBold),
                      ),
                      Icon(
                        state.muscleGroup.contains(muscleGroup[index])
                            ? Icons.arrow_drop_up_sharp
                            : Icons.arrow_drop_down_outlined,
                        color: state.muscleGroup.contains(muscleGroup[index])
                            ? AppColor.white
                            : AppColor.black,
                      )
                    ],
                  ),
                ),
              ),
              if (state.muscleGroup.contains(muscleGroup[index]))
                BlocBuilder<ExericseCubit, ExericseState>(
                  builder: (context, stateEx) {
                    return exerciseWidget(
                        stateEx, muscleGroup[index], exercise);
                  },
                ),
            ],
          );
        },
      ),
    );
  }
}

Widget exerciseWidget(ExericseState stateEx, String muscleGroup,
    Map<String, List<String>> exercise) {
  return SizedBox(
    height: AppDimens.dimens_36 * exercise[muscleGroup]!.length,
    child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: exercise[muscleGroup]!.length,
        itemBuilder: (context, indexExercise) {
          int curentExcercise = stateEx.map.values.toList().indexWhere(
                (element) => element == exercise[muscleGroup]![indexExercise],
              );
          return GestureDetector(
              onTap: () {
                context.read<ExericseCubit>().addAndRemoveExercise(
                    exercise[muscleGroup]![indexExercise]);
              },
              child: Container(
                height: AppDimens.dimens_35,
                padding: const EdgeInsets.only(
                    left: AppDimens.dimens_2,
                    bottom: AppDimens.dimens_2,
                    top: AppDimens.dimens_2),
                child: Row(
                  children: [
                    const SizedBox(
                      width: AppDimens.dimens_10,
                    ),
                    if (curentExcercise >= 0)
                      Container(
                        alignment: Alignment.center,
                        width: AppDimens.dimens_40,
                        child: Text(
                          (curentExcercise + 1).toString(),
                          style: const TextStyle(color: AppColor.black),
                        ),
                      ),
                    if (curentExcercise < 0)
                      SizedBox(
                        width: AppDimens.dimens_40,
                        child: Text(
                          (curentExcercise + 1).toString(),
                          style: const TextStyle(color: AppColor.white),
                        ),
                      ),
                    const SizedBox(
                      height: AppDimens.dimens_10,
                    ),
                    Text(
                      exercise[muscleGroup]![indexExercise],
                      style: const TextStyle(
                        color: AppColor.black,
                        fontSize: AppDimens.dimens_14,
                      ),
                    ),
                  ],
                ),
              ));
        }),
  );
}
