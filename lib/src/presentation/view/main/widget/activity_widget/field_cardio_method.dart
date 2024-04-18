import 'package:fitness_nutrition/src/presentation/view/main/cubit/activity_cubit/activity_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/resource/app_dimens.dart';
import '../../../../../core/resource/app_fonts.dart';
import '../../../../../core/resource/app_string.dart';
import '../../../../widget/global/text_form_field.dart';
import 'set_and_rest_time.dart';

class FieldCardioMethod extends StatelessWidget {
  const FieldCardioMethod(this.map, {super.key});
  final Map<String, Map<String, String>> map;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActivityCubit, ActivityState>(
      builder: (context, state) {
        return Column(
          children: [
            Text(
                'Import time${state.exercise.values.first.values.toList()[0] == AppString.hittCardio ? ',rest time' : ''} and set',
                style: const TextStyle(
                    fontSize: AppDimens.dimens_24, fontWeight: AppFont.medium)),
            const SizedBox(
              height: AppDimens.dimens_10,
            ),
            SizedBox(
              width: double.infinity,
              child: Row(
                children: [
                  const SizedBox(
                    width: AppDimens.dimens_110,
                    child: Text('Time',
                        style: TextStyle(
                            fontSize: AppDimens.dimens_20,
                            fontWeight: AppFont.medium)),
                  ),
                  const SizedBox(
                    width: AppDimens.dimens_20,
                  ),
                  Expanded(
                    child: TextFormFieldWidget(
                      'time',
                      (value) {
                        context.read<ActivityCubit>().addTimeCardio(value);
                      },
                      (value) {
                        return textError(value, 'time', 10);
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: AppDimens.dimens_10,
            ),
            SizedBox(
              width: double.infinity,
              child: Row(
                children: [
                  SizedBox(
                    width: AppDimens.dimens_110,
                    child: Text(
                        state.exercise.values.first.values.toList()[1] ==
                                'group'
                            ? 'Set of level'
                            : 'Set',
                        style: const TextStyle(
                            fontSize: AppDimens.dimens_20,
                            fontWeight: AppFont.medium)),
                  ),
                  const SizedBox(
                    width: AppDimens.dimens_20,
                  ),
                  Expanded(
                    child: TextFormFieldWidget(
                      'Set',
                      (value) {
                        context.read<ActivityCubit>().addSetCardio(value);
                      },
                      (value) {
                        return textError(value, 'set', 1);
                      },
                    ),
                  ),
                ],
              ),
            ),
            if (state.exercise.values.first.values.toList()[0] ==
                AppString.hittCardio)
              const SizedBox(
                height: AppDimens.dimens_10,
              ),
            state.exercise.values.first.values.toList()[0] ==
                    AppString.hittCardio
                ? SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: AppDimens.dimens_110,
                          child: Text('Rest time',
                              style: TextStyle(
                                  fontSize: AppDimens.dimens_20,
                                  fontWeight: AppFont.medium)),
                        ),
                        const SizedBox(
                          width: AppDimens.dimens_20,
                        ),
                        Expanded(
                          child: TextFormFieldWidget(
                            'Rest time',
                            (value) {
                              context
                                  .read<ActivityCubit>()
                                  .addRestTimeCardio(value);
                            },
                            (value) {
                              return textError(value, 'rest time', 10);
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                : const SizedBox(),
          ],
        );
      },
    );
  }
}
