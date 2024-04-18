import 'package:fitness_nutrition/src/presentation/bloc/meal_cubit/meal_cubit.dart';
import 'package:fitness_nutrition/src/presentation/view/main/widget/nutrition_widget.dart/meal_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../../../../../config/route/route_generator_route.dart';
import '../../../../../core/funtions/calculate_calories.dart';
import '../../../../../core/funtions/day_of_week.dart';
import '../../../../../core/funtions/get_index.dart';
import '../../../../../core/funtions/get_meal_of_day.dart';
import '../../../../../core/funtions/get_value_meal.dart';
import '../../../../../core/resource/app_colors.dart';
import '../../../../../core/resource/app_dimens.dart';
import '../../../../../core/resource/app_fonts.dart';
import '../../../../../core/resource/app_string.dart';
import '../../../../../domain/entities/infomation.dart';
import '../../../../../domain/entities/meal.dart';
import '../../../../widget/global/nutri_circular_progress.dart';

class CaloriesWidget extends StatelessWidget {
  const CaloriesWidget(
      {super.key,
      required this.sizeScreen,
      required this.index,
      required this.listInfomation});
  final int index;
  final List<Infomation> listInfomation;
  final Size sizeScreen;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealCubit, MealState>(
      builder: (context, state) {
        final List<Meal> newlist = getMealOfDay(state.allMeal, index);
        final caloriesToday = valueMealOfDay(newlist, AppString.calories);
        final proteinToday = valueMealOfDay(newlist, AppString.protein);
        final carbToday = valueMealOfDay(newlist, AppString.carb);
        final fatToday = valueMealOfDay(newlist, AppString.fat);
        final bool checkToday = getWeek(DateTime.now())[index] ==
            DateTime.parse(DateFormat('yyyy-MM-dd').format(DateTime.now()));

        double caloriesPerDay;
        double proteinPerDay;
        double fatPerDay;
        double carbPerDay;

        if (getIndex(listInfomation, index) < 0) {
          caloriesPerDay = 0;
          fatPerDay = 0;
          carbPerDay = 0;
          proteinPerDay = 0;
        } else {
          Infomation infomation =
              listInfomation[getIndex(listInfomation, index)];
          caloriesPerDay = getCalories(infomation.bodyFat, infomation.weight,
              infomation.dayTraining, infomation.goal);
          proteinPerDay = caloriesPerDay * infomation.protein / 100 / 4;
          fatPerDay = caloriesPerDay * infomation.fat / 100 / 9;
          carbPerDay = caloriesPerDay * infomation.carbs / 100 / 4;
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircularPercentIndicator(
                radius: sizeScreen.width * 0.33,
                lineWidth: AppDimens.dimens_14,
                circularStrokeCap: CircularStrokeCap.round,
                percent: caloriesPerDay == 0
                    ? 0
                    : (caloriesToday / caloriesPerDay) > 1
                        ? 1
                        : (caloriesToday / caloriesPerDay),
                backgroundColor: AppColor.pink.withOpacity(0.1),
                progressColor: AppColor.pink,
                center: FittedBox(
                    child: RichText(
                        text: TextSpan(children: [
                  TextSpan(
                      text: caloriesToday.toStringAsFixed(1),
                      style: TextStyle(
                          fontSize: AppDimens.dimens_32,
                          fontWeight: AppFont.semiBold,
                          color: (caloriesToday / caloriesPerDay) > 1
                              ? AppColor.red
                              : AppColor.pink)),
                  TextSpan(
                      text: '/${caloriesPerDay.toStringAsFixed(0)} kcal',
                      style: TextStyle(
                          fontSize: AppDimens.dimens_22,
                          fontWeight: AppFont.semiBold,
                          color: AppColor.black.withOpacity(0.5)))
                ]))),
              ),
            ),
            const SizedBox(
              height: AppDimens.dimens_16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NutriCircularProgress(
                  percent: getValue(proteinToday, proteinPerDay),
                  radius: AppDimens.dimens_20,
                  color: AppColor.orange,
                  opacity: 0.1,
                  fontWeight: AppFont.semiBold,
                  fontSize: AppDimens.dimens_14,
                  text: ((proteinPerDay == 0
                              ? 0
                              : (proteinToday / proteinPerDay)) *
                          100)
                      .toStringAsFixed(1),
                  label: AppString.protein,
                  value: proteinPerDay,
                  textLabelSize: AppDimens.dimens_18,
                  textValueSize: AppDimens.dimens_14,
                ),
                NutriCircularProgress(
                  percent: getValue(fatToday, fatPerDay),
                  radius: AppDimens.dimens_20,
                  color: AppColor.yellow,
                  opacity: 0.1,
                  fontWeight: AppFont.semiBold,
                  fontSize: AppDimens.dimens_14,
                  text: ((fatPerDay == 0 ? 0 : (fatToday / fatPerDay)) * 100)
                      .toStringAsFixed(1),
                  label: AppString.fat,
                  value: fatPerDay,
                  textLabelSize: AppDimens.dimens_18,
                  textValueSize: AppDimens.dimens_14,
                ),
                NutriCircularProgress(
                  percent: getValue(carbToday, carbPerDay),
                  radius: AppDimens.dimens_20,
                  color: AppColor.red,
                  opacity: 0.1,
                  fontWeight: AppFont.semiBold,
                  fontSize: AppDimens.dimens_14,
                  text: ((carbPerDay == 0 ? 0 : (carbToday / carbPerDay)) * 100)
                      .toStringAsFixed(1),
                  label: AppString.carb,
                  value: carbPerDay,
                  textLabelSize: AppDimens.dimens_18,
                  textValueSize: AppDimens.dimens_14,
                ),
              ],
            ),
            if (checkToday)
              const SizedBox(
                height: AppDimens.dimens_16,
              ),
            if (checkToday)
              const Text(
                'Bữa ăn hôm nay',
                style: TextStyle(
                    fontSize: AppDimens.dimens_18,
                    fontWeight: AppFont.semiBold),
              ),
            if (checkToday)
              const SizedBox(
                height: AppDimens.dimens_16,
              ),
            if (checkToday)
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(RouteGenerator.mealScreen);
                },
                child: Container(
                  height: AppDimens.dimens_130,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: AppDimens.dimens_1,
                          color: AppColor.pink.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(AppDimens.dimens_16)),
                  child: const Icon(
                    Icons.add_circle_outline_sharp,
                    color: AppColor.pink,
                    size: AppDimens.dimens_42,
                  ),
                ),
              ),
            const SizedBox(
              height: AppDimens.dimens_16,
            ),
            SizedBox(
              height: AppDimens.dimens_130 * newlist.length +
                  AppDimens.dimens_15 * newlist.length,
              child: ListView.builder(
                  reverse: true,
                  itemCount: newlist.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return MealItem(newlist[index]);
                  }),
            ),
            const SizedBox(
              height: AppDimens.dimens_110,
            )
          ],
        );
      },
    );
  }
}

double getValue(double now, double all) {
  return all == 0
      ? 0
      : (now / all) > 1
          ? 1
          : (now / all);
}
