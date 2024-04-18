import 'package:fitness_nutrition/src/presentation/view/main/widget/nutrition_widget.dart/meal_ingredients.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../core/resource/app_colors.dart';
import '../../../../../core/resource/app_dimens.dart';
import '../../../../../core/resource/app_fonts.dart';
import '../../../../../core/resource/app_string.dart';
import '../../../../../domain/entities/meal.dart';
import '../../../meal/meal.dart';

class MealItem extends StatelessWidget {
  const MealItem(this.meal, {super.key});
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: AppDimens.dimens_130,
        width: double.infinity,
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: AppDimens.dimens_16),
        padding: const EdgeInsets.all(AppDimens.dimens_8),
        decoration: BoxDecoration(
            border: Border.all(
                width: AppDimens.dimens_1,
                color: AppColor.pink.withOpacity(0.5)),
            borderRadius: BorderRadius.circular(AppDimens.dimens_16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bữa ăn lúc ${dateTime(meal.dateTime)} ',
              style: const TextStyle(
                  fontSize: AppDimens.dimens_18, fontWeight: AppFont.semiBold),
            ),
            Expanded(
                child: MealIngredientsWidget(
                    calories: valueMeal(meal.foods, AppString.calories),
                    protein: valueMeal(meal.foods, AppString.protein),
                    carb: valueMeal(meal.foods, AppString.carb),
                    fat: valueMeal(meal.foods, AppString.fat)))
          ],
        ),
      ),
    );
  }
}

String dateTime(String dateTime) {
  return DateFormat('HH:mm').format(DateTime.parse(dateTime));
}
