import 'package:fitness_nutrition/src/core/resource/app_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resource/app_another.dart';
import '../../../../core/resource/app_colors.dart';
import '../../../../core/resource/app_dimens.dart';

import '../../../../data/source/local/pref/pref_local.dart';
import '../../../../domain/entities/food.dart';

import '../../../widget/global/bottom_navigation_bar.dart';

import '../../main/widget/nutrition_widget.dart/meal_ingredients.dart';
import '../../../widget/global/text_field.dart';
import '../bloc/set_weight/set_weight_cubit.dart';

class ModalPopupWidget extends StatelessWidget {
  const ModalPopupWidget(this.current, {super.key});
  final int current;
  @override
  Widget build(BuildContext context) {
    final Food food = AppAnother.listFood[current];
    return CupertinoPopupSurface(
      child: Container(
          color: AppColor.grey1,
          height: MediaQuery.of(context).size.height * 0.4,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
              horizontal: AppDimens.dimens_16, vertical: AppDimens.dimens_16),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: BlocProvider<SetWeightCubit>(
              create: (context) => SetWeightCubit(),
              child: BlocBuilder<SetWeightCubit, SetWeightState>(
                builder: (context, state) {
                  return SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFieldWidget((value) {
                            context
                                .read<SetWeightCubit>()
                                .onChangeValueDouble(value);
                          }, '100 gram', TextInputType.number, const SizedBox(),
                              true),
                          if (state.errorText != '')
                            Text(
                              state.errorText,
                              style: const TextStyle(color: AppColor.red),
                            ),
                          const SizedBox(
                            height: AppDimens.dimens_30,
                          ),
                          Container(
                            height: AppDimens.dimens_105,
                            width: double.infinity,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(AppDimens.dimens_8),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: AppDimens.dimens_1,
                                    color: AppColor.pink.withOpacity(0.5)),
                                borderRadius:
                                    BorderRadius.circular(AppDimens.dimens_16)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    child: MealIngredientsWidget(
                                        calories: ((state.weight / 100) *
                                            food.calories),
                                        protein: ((state.weight / 100) *
                                            food.protein),
                                        carb:
                                            ((state.weight / 100) * food.carb),
                                        fat: ((state.weight / 100) * food.fat)))
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: AppDimens.dimens_30,
                          ),
                          BottomNavigationBarWidget(() async {
                            await PrefLocal().setPreferences();
                            await PrefLocal()
                                .setDouble('weight', state.weight)
                                .then((value) async {
                              await PrefLocal().setInt('position', current);
                            }).then((value) {
                              Navigator.of(context).pop();
                            });
                          }, state.errorText == '', AppString.continues)
                        ]),
                  );
                },
              ),
            ),
          )),
    );
  }
}
