import 'package:fitness_nutrition/src/core/resource/app_colors.dart';
import 'package:fitness_nutrition/src/core/resource/app_fonts.dart';
import 'package:fitness_nutrition/src/presentation/view/main/cubit/activity_cubit/activity_cubit.dart';
import 'package:fitness_nutrition/src/presentation/view/main/widget/activity_widget/set_and_rest_time.dart';
import 'package:fitness_nutrition/src/presentation/widget/global/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/resource/app_dimens.dart';

class FieldAnotherMethod extends StatelessWidget {
  const FieldAnotherMethod(this.map, {super.key});
  final Map<String, Map<String, String>> map;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Import set and rest time',
          style: TextStyle(
              fontSize: AppDimens.dimens_24,
              fontWeight: AppFont.semiBold,
              color: AppColor.black),
        ),
        const SizedBox(
          height: AppDimens.dimens_10,
        ),
        Expanded(
            child: ListView.builder(
          itemBuilder: (context, index) {
            String exercise = map.values.first.values.toList()[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: AppDimens.dimens_5),
                  child: Text(
                    exercise,
                    style: const TextStyle(
                        fontSize: AppDimens.dimens_20,
                        fontWeight: AppFont.semiBold),
                  ),
                ),
                const SizedBox(
                  height: AppDimens.dimens_5,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: AppDimens.dimens_100,
                        child: Text(
                          'Set',
                          style: TextStyle(
                              fontSize: AppDimens.dimens_20,
                              fontWeight: AppFont.medium),
                        ),
                      ),
                      const SizedBox(
                        width: AppDimens.dimens_20,
                      ),
                      Expanded(
                        child: TextFormFieldWidget(
                          'set',
                          (value) {
                            context.read<ActivityCubit>().setSet(value, index);
                          },
                          (value) {
                            return textError(value, 'set', 1);
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
                      const SizedBox(
                        width: AppDimens.dimens_100,
                        child: Text(
                          'Rest time',
                          style: TextStyle(
                              fontSize: AppDimens.dimens_20,
                              fontWeight: AppFont.medium),
                        ),
                      ),
                      const SizedBox(
                        width: AppDimens.dimens_20,
                      ),
                      Expanded(
                        child: TextFormFieldWidget('rest time', (value) {
                          context
                              .read<ActivityCubit>()
                              .setRestTime(value, index);
                        }, (value) {
                          return textError(value, 'rest time', 30);
                        }),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: AppDimens.dimens_10,
                ),
                if (exercise.contains('Dropset'))
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: AppDimens.dimens_100,
                          child: Text('Set drop',
                              style: TextStyle(
                                  fontSize: AppDimens.dimens_20,
                                  fontWeight: AppFont.medium)),
                        ),
                        const SizedBox(
                          width: AppDimens.dimens_20,
                        ),
                        Expanded(
                            child: TextFormFieldWidget(
                          'set drop',
                          (value) {
                            context
                                .read<ActivityCubit>()
                                .setSetDrop(value, index);
                          },
                          (value) {
                            return textError(value, 'set drop', 1);
                          },
                        )),
                      ],
                    ),
                  ),
                const SizedBox(
                  height: AppDimens.dimens_10,
                ),
                if (exercise.contains('Dropset'))
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: AppDimens.dimens_100,
                          child: Text(
                            'Rest drop',
                            style: TextStyle(
                                fontSize: AppDimens.dimens_20,
                                fontWeight: AppFont.medium),
                          ),
                        ),
                        const SizedBox(
                          width: AppDimens.dimens_20,
                        ),
                        Expanded(
                            child: TextFormFieldWidget(
                          'rest drop',
                          (value) {
                            context
                                .read<ActivityCubit>()
                                .setRestDrop(value, index);
                          },
                          (value) {
                            return textError(value, 'rest drop', 3);
                          },
                        )),
                      ],
                    ),
                  )
              ],
            );
          },
          itemCount: map.values.first.length,
        )),
      ],
    );
  }
}
