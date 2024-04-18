import 'package:fitness_nutrition/src/presentation/view/schedule/cubit/schedule_screen_cubit/schedule_screen_cubit.dart';
import 'package:fitness_nutrition/src/presentation/view/schedule/widget/cardio/cardio_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/resource/app_another.dart';
import '../../../../../core/resource/app_dimens.dart';
import '../../cubit/exercsie_cubit/exericse_cubit.dart';

class ChooseLissExercise extends StatelessWidget {
  const ChooseLissExercise(this.controller, {super.key});
  final PageController? controller;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: AppDimens.dimens_20),
          child: Column(children: [
            SizedBox(
              height:
                  AppDimens.dimens_55 * AppAnother.lissCardioExercise.length,
              child: ListView.builder(
                  padding: const EdgeInsets.all(AppDimens.dimens_0),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: AppAnother.lissCardioExercise.length,
                  itemBuilder: (context, index) =>
                      BlocConsumer<ExericseCubit, ExericseState>(
                        listener: (context, state) {
                          if (state.map.isNotEmpty) {
                            context
                                .read<ScheduleScreenMainCubit>()
                                .addAndRemoveExercise(state.map);
                            context.read<ExericseCubit>().resetData();
                            controller!.animateToPage(3,
                                duration: const Duration(microseconds: 300),
                                curve: Curves.linear);
                            context
                                .read<ScheduleScreenMainCubit>()
                                .setCardioMethod('');
                            context
                                .read<ScheduleScreenMainCubit>()
                                .setHiitMethod('');
                            context
                                .read<ScheduleScreenMainCubit>()
                                .changeChooseExercise(false);
                          }
                        },
                        builder: (context, state) {
                          return GestureDetector(
                              onTap: () {
                                context
                                    .read<ExericseCubit>()
                                    .addLissExerciseCardio(
                                      AppAnother.lissCardioExercise[index],
                                    );
                              },
                              child: Column(
                                children: [
                                  CardioButtonWidget(
                                      AppAnother.lissCardioExercise[index]),
                                  const SizedBox(
                                    height: AppDimens.dimens_10,
                                  )
                                ],
                              ));
                        },
                      )),
            ),
            GestureDetector(
                onTap: () {
                  context
                      .read<ScheduleScreenMainCubit>()
                      .changeChooseExercise(true);
                  context.read<ExericseCubit>().resetData();
                },
                child: const CardioButtonWidget('Chọn các bài tập tại chỗ'))
          ])),
    );
  }
}
