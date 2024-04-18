import 'package:fitness_nutrition/src/core/resource/app_dimens.dart';
import 'package:fitness_nutrition/src/core/resource/app_string.dart';
import 'package:fitness_nutrition/src/presentation/bloc/schedule_cubit/schedule_cubit.dart';
import 'package:fitness_nutrition/src/presentation/view/main/cubit/activity_cubit/activity_cubit.dart';
import 'package:fitness_nutrition/src/presentation/view/main/cubit/change_page_cubit/change_page_cubit.dart';
import 'package:fitness_nutrition/src/presentation/view/schedule/widget/cardio/cardio_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../../../core/funtions/day_of_week.dart';
import '../../../../../core/funtions/get_list_method.dart';

class ChoosePlan extends StatelessWidget {
  const ChoosePlan({super.key});

  @override
  Widget build(BuildContext context) {
    final List<DateTime> listDateTime = getWeek(DateTime.now());
    return BlocBuilder<ScheduleCubit, ScheduleState>(
      builder: (context, state) {
        List<Map<String, Map<String, String>>> listNow = getList(
            state.allWorkoutSchedulel,
            listDateTime.indexWhere(
              (element) =>
                  DateFormat('E').format(DateTime.now()) ==
                  DateFormat('E').format(element),
            ));

        return Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppDimens.dimens_15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: listNow.length * (AppDimens.dimens_60),
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: listNow.length,
                    itemBuilder: (context, index) => Column(
                          children: [
                            GestureDetector(
                                onTap: () {
                                  context
                                      .read<ActivityCubit>()
                                      .addPlanExercise(listNow[index]);
                                  context.read<ChangePageCubit>().changePage(
                                      listNow[index].keys.first ==
                                              AppString.cardio
                                          ? 6
                                          : 2);
                                },
                                child: CardioButtonWidget(
                                    listNow[index].keys.first)),
                            const SizedBox(
                              height: AppDimens.dimens_15,
                            )
                          ],
                        )),
              ),
              GestureDetector(
                  onTap: () {
                    context.read<ChangePageCubit>().changePage(1);
                  },
                  child: const CardioButtonWidget('Chọn bài tập')),
            ],
          ),
        ));
      },
    );
  }
}
