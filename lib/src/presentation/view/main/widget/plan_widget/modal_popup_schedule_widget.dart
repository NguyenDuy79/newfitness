import 'package:fitness_nutrition/src/domain/entities/workout_schedule.dart';
import 'package:fitness_nutrition/src/presentation/bloc/schedule_cubit/schedule_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/resource/app_colors.dart';
import '../../../../../core/resource/app_dimens.dart';
import '../../../../widget/global/bottom_navigation_bar.dart';
import '../../../../widget/global/text_field.dart';
import '../../../meal/bloc/set_weight/set_weight_cubit.dart';

class ModalPopupScheduleWidget extends StatelessWidget {
  const ModalPopupScheduleWidget(this.workoutSchedule, this.listName,
      {super.key});
  final WorkoutSchedule workoutSchedule;
  final List<String> listName;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SetWeightCubit>(
      create: (context) => SetWeightCubit(),
      child: CupertinoPopupSurface(
        child: Container(
          color: AppColor.grey1,
          height: MediaQuery.of(context).size.height * 0.4,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
              horizontal: AppDimens.dimens_16, vertical: AppDimens.dimens_16),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: BlocBuilder<SetWeightCubit, SetWeightState>(
              builder: (context, state) {
                return Column(children: [
                  TextFieldWidget((value) {
                    context
                        .read<SetWeightCubit>()
                        .onChangeValueString(value, listName);
                  }, 'name', TextInputType.text, const SizedBox(), false),
                  if (state.errorText != '')
                    Text(
                      state.errorText,
                      style: const TextStyle(color: AppColor.red),
                    ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  BottomNavigationBarWidget(() async {
                    final WorkoutSchedule newWorkoutSchedule = WorkoutSchedule(
                        dateTime: DateTime.now().toString(),
                        key: 0,
                        check: true,
                        name: state.name,
                        mon: workoutSchedule.mon,
                        tue: workoutSchedule.tue,
                        wed: workoutSchedule.wed,
                        thu: workoutSchedule.thu,
                        fri: workoutSchedule.fri,
                        sat: workoutSchedule.sat,
                        sun: workoutSchedule.sun);
                    await context.read<ScheduleCubit>().updateAll().then(
                        (value) async => await context
                            .read<ScheduleCubit>()
                            .addSchedule(newWorkoutSchedule.toMap())
                            .then((value) => Navigator.of(context).pop())
                            .then((value) => Navigator.of(context).pop()));
                  }, state.errorText.isEmpty && state.name.isNotEmpty, 'Xong')
                ]);
              },
            ),
          ),
        ),
      ),
    );
  }
}
