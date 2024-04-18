import 'package:fitness_nutrition/src/presentation/view/meal/bloc/meal/meal_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../core/resource/app_colors.dart';
import '../../../../core/resource/app_dimens.dart';
import '../../../../core/resource/app_fonts.dart';
import '../../../../domain/entities/food.dart';

class MealsItemChoose extends StatelessWidget {
  const MealsItemChoose(this.food, this.index, {super.key});
  final Map<double, Food> food;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(index),
      endActionPane:
          ActionPane(extentRatio: 0.2, motion: const ScrollMotion(), children: [
        SlidableAction(
          onPressed: (BuildContext context) {
            context
                .read<MealScreenCubit>()
                .deleteFood(food.keys.first, food.values.first);
          },
          backgroundColor: Theme.of(context).colorScheme.background,
          foregroundColor: AppColor.red,
          icon: Icons.delete,
        )
      ]),
      child: Container(
        height: AppDimens.dimens_40,
        padding: const EdgeInsets.all(AppDimens.dimens_5),
        margin: const EdgeInsets.only(bottom: AppDimens.dimens_5),
        decoration: BoxDecoration(
            border: Border.all(
                width: AppDimens.dimens_1,
                color: AppColor.pink.withOpacity(0.4)),
            borderRadius: BorderRadius.circular(AppDimens.dimens_16)),
        child: Padding(
          padding: const EdgeInsets.only(left: AppDimens.dimens_12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                food.values.first.name,
                style: const TextStyle(
                    fontSize: AppDimens.dimens_16,
                    fontWeight: AppFont.semiBold),
              ),
              Text('${food.keys.first.toString()}g')
            ],
          ),
        ),
      ),
    );
  }
}
