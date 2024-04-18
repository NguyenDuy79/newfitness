import 'package:fitness_nutrition/src/presentation/widget/global/circular_progress.dart';
import 'package:flutter/material.dart';
import '../../../../../core/resource/app_colors.dart';
import '../../../../../core/resource/app_dimens.dart';
import '../../../../../core/resource/app_fonts.dart';

class MealIngredientsWidget extends StatelessWidget {
  const MealIngredientsWidget(
      {super.key,
      required this.calories,
      required this.protein,
      required this.carb,
      required this.fat});
  final double calories;
  final double protein;
  final double carb;
  final double fat;
  @override
  Widget build(BuildContext context) {
    Size sizeScreen = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: (sizeScreen.width - AppDimens.dimens_67) / 2,
              height: AppDimens.dimens_40,
              alignment: Alignment.centerLeft,
              child: Text(
                'Calories: ${calories.toStringAsFixed(1)}kcal',
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Row(
              children: [
                CircularPercentWidget(
                    AppDimens.dimens_20,
                    AppColor.yellow,
                    calories == 0
                        ? '0'
                        : (fat * 9 / calories * 100).toStringAsFixed(1),
                    calories == 0 ? 0 : fat * 9 / calories,
                    AppDimens.dimens_14,
                    AppFont.semiBold,
                    0.1,
                    AppDimens.dimens_5),
                const SizedBox(
                  width: AppDimens.dimens_5,
                ),
                SizedBox(
                  width: (sizeScreen.width - AppDimens.dimens_67) / 2 -
                      AppDimens.dimens_45,
                  child: Text(
                    '${fat.toStringAsFixed(1)}g fat',
                  ),
                )
              ],
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircularPercentWidget(
                    AppDimens.dimens_20,
                    AppColor.orange,
                    calories == 0
                        ? '0'
                        : (protein * 4 / calories * 100).toStringAsFixed(1),
                    calories == 0 ? 0 : protein * 4 / calories,
                    AppDimens.dimens_14,
                    AppFont.semiBold,
                    0.1,
                    AppDimens.dimens_5),
                const SizedBox(
                  width: AppDimens.dimens_5,
                ),
                SizedBox(
                  width: (sizeScreen.width - AppDimens.dimens_67) / 2 -
                      AppDimens.dimens_45,
                  child: Text(
                    '${protein.toStringAsFixed(1)}g protein',
                  ),
                )
              ],
            ),
            Row(
              children: [
                CircularPercentWidget(
                    AppDimens.dimens_20,
                    AppColor.red,
                    calories == 0
                        ? '0'
                        : (carb * 4 / calories * 100).toStringAsFixed(1),
                    calories == 0 ? 0 : carb * 4 / calories,
                    AppDimens.dimens_14,
                    AppFont.semiBold,
                    0.1,
                    AppDimens.dimens_5),
                const SizedBox(
                  width: AppDimens.dimens_5,
                ),
                SizedBox(
                  width: (sizeScreen.width - AppDimens.dimens_67) / 2 -
                      AppDimens.dimens_45,
                  child: Text(
                    '${carb.toStringAsFixed(1)}g carbs',
                  ),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
