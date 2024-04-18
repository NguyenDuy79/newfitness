import 'package:fitness_nutrition/src/presentation/view/main/screen/plan_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

import '../../../../../core/funtions/upper_first.dart';
import '../../../../../core/resource/app_colors.dart';
import '../../../../../core/resource/app_dimens.dart';
import '../../../../../core/resource/app_fonts.dart';
import '../../../../../domain/entities/workout_schedule.dart';
import '../../../../bloc/schedule_cubit/schedule_cubit.dart';
import 'modal_popup_schedule_show_widget.dart';

class PlanItemWidget extends StatelessWidget {
  const PlanItemWidget(this.index, this.allWorkoutSchedulel, {super.key});
  final int index;
  final List<WorkoutSchedule> allWorkoutSchedulel;
  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(index),
      endActionPane:
          ActionPane(extentRatio: 0.2, motion: const ScrollMotion(), children: [
        SlidableAction(
          onPressed: (BuildContext context) async {
            await context
                .read<ScheduleCubit>()
                .deleteSchedule(allWorkoutSchedulel[index].key);
          },
          backgroundColor: Theme.of(context).colorScheme.background,
          foregroundColor: AppColor.red,
          icon: Icons.delete,
        )
      ]),
      child: GestureDetector(
        onTap: () async {
          await showCupertinoModalPopup(
              context: context,
              builder: (context) =>
                  ModalPopupScheduleShowWidget(allWorkoutSchedulel[index]));
        },
        child: Container(
          height: AppDimens.dimens_104,
          width: double.infinity,
          padding: const EdgeInsets.all(AppDimens.dimens_16),
          margin: const EdgeInsets.only(bottom: AppDimens.dimens_15),
          decoration: BoxDecoration(
              color: allWorkoutSchedulel[index].check
                  ? AppColor.pink
                  : AppColor.white,
              borderRadius: BorderRadius.circular(AppDimens.dimens_24),
              border: Border.all(
                  width: AppDimens.dimens_1,
                  color: AppColor.pink.withOpacity(0.5))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tên: ${upperFirstChar(allWorkoutSchedulel[index].name)}',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: allWorkoutSchedulel[index].check
                        ? AppColor.white
                        : AppColor.black,
                    fontSize: AppDimens.dimens_18,
                    fontWeight: AppFont.semiBold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Số ngày tập luyện: ${totalDayWorkout(allWorkoutSchedulel[index])}',
                        style: TextStyle(
                            color: allWorkoutSchedulel[index].check
                                ? AppColor.white
                                : AppColor.black),
                      ),
                      Text(
                        'Tổng số bài tập: ${totalExercise(allWorkoutSchedulel[index])}',
                        style: TextStyle(
                            color: allWorkoutSchedulel[index].check
                                ? AppColor.white
                                : AppColor.black),
                      )
                    ],
                  ),
                  Text(
                    DateFormat('dd/MM/yyyy').format(
                        DateTime.parse(allWorkoutSchedulel[index].dateTime)),
                    style: TextStyle(
                        color: allWorkoutSchedulel[index].check
                            ? AppColor.white
                            : AppColor.black),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
