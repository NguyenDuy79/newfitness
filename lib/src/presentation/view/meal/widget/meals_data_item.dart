// ignore_for_file: use_build_context_synchronously

import 'package:fitness_nutrition/src/presentation/view/meal/bloc/meal/meal_cubit.dart';
import 'package:fitness_nutrition/src/presentation/view/meal/widget/modal_popup_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resource/app_another.dart';
import '../../../../core/resource/app_colors.dart';
import '../../../../core/resource/app_dimens.dart';
import '../../../../core/resource/app_fonts.dart';
import '../../../../data/source/local/pref/pref_local.dart';
import '../../../../domain/entities/food.dart';

class MealsDataItem extends StatelessWidget {
  const MealsDataItem(this.listFood, this.index, {super.key});
  final List<Food> listFood;
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final int currentFood = AppAnother.listFood.indexWhere(
          (element) => listFood[index].name == element.name,
        );
        showCupertinoModalPopup(
            context: context,
            builder: (context) => ModalPopupWidget(
                  currentFood,
                )).then((value) async {
          await PrefLocal().setPreferences();
          if (PrefLocal().isExistKey('weight') &&
              PrefLocal().isExistKey('position')) {
            context.read<MealScreenCubit>().addFood(
                PrefLocal().getDouble('weight')!,
                AppAnother.listFood[PrefLocal().getInt('position')]);
          }
        }).then((value) {
          PrefLocal().clearKey('position');
          PrefLocal().clearKey('weight');
        });
      },
      child: Container(
        height: AppDimens.dimens_60,
        padding: const EdgeInsets.all(AppDimens.dimens_5),
        margin: const EdgeInsets.only(bottom: AppDimens.dimens_5),
        decoration: BoxDecoration(
            border: Border.all(
                width: AppDimens.dimens_1,
                color: AppColor.pink.withOpacity(0.4)),
            borderRadius: BorderRadius.circular(AppDimens.dimens_16)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: AppDimens.dimens_12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    listFood[index].name,
                    style: const TextStyle(
                        fontSize: AppDimens.dimens_16,
                        fontWeight: AppFont.semiBold),
                  ),
                  Text('${listFood[index].calories}kcal - 100g')
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: AppDimens.dimens_12),
              child: Icon(
                Icons.add,
                color: AppColor.pink,
                size: AppDimens.dimens_35,
              ),
            )
          ],
        ),
      ),
    );
  }
}
