import 'package:fitness_nutrition/src/presentation/bloc/schedule_cubit/schedule_cubit.dart';
import 'package:fitness_nutrition/src/presentation/view/schedule/widget/gym_and_calis_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/resource/app_another.dart';
import '../../../../core/resource/app_colors.dart';
import '../../../../core/resource/app_dimens.dart';
import '../../../../core/resource/app_fonts.dart';
import '../../../widget/global/back_button.dart';
import '../../../widget/global/bottom_navigation_bar.dart';
import '../cubit/exercsie_cubit/exericse_cubit.dart';

import 'schedule_main_screen.dart';

class Calisthenics extends StatelessWidget {
  const Calisthenics(
      this.controller, this.functionDone, this.functionBack, this.functionExit,
      {super.key});
  final PageController? controller;
  final Function(BuildContext context, ExericseState state)? functionDone;
  final Function(BuildContext context)? functionBack;
  final Function(BuildContext context, ScheduleState state)? functionExit;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppDimens.dimens_24),
          child: Column(
            children: [
              Row(
                children: [
                  BackButtonWidget(() {
                    controller == null
                        ? functionBack!(context)
                        : backButton(context, controller!);
                  }),
                  const Expanded(child: SizedBox()),
                  BlocBuilder<ScheduleCubit, ScheduleState>(
                    builder: (context, state) {
                      return CupertinoButton(
                          child: Text(
                            'Thoát',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: AppFont.semiBold,
                                color: AppColor.blue.withOpacity(0.8)),
                          ),
                          onPressed: () {
                            controller == null
                                ? functionExit!(context, state)
                                : exitButton(context, controller!);
                          });
                    },
                  )
                ],
              ),
              const SizedBox(
                height: AppDimens.dimens_16,
              ),
              const Text(
                'Tập đường phố',
                style: TextStyle(
                    fontSize: AppDimens.dimens_24,
                    fontWeight: AppFont.semiBold),
              ),
              const SizedBox(
                height: AppDimens.dimens_16,
              ),
              const Expanded(
                  child: GymAndCalisWidget(
                      AppAnother.muscleGroupCalis, AppAnother.exerciseCalis))
            ],
          ),
        ),
        bottomNavigationBar: BlocBuilder<ExericseCubit, ExericseState>(
          builder: (context, state) {
            return BottomNavigationBarWidget(() {
              controller == null
                  ? functionDone!(context, state)
                  : doneButton(context, controller!, state);
            }, state.map.isNotEmpty, 'Xong');
          },
        ));
  }
}
