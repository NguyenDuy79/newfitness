import 'package:fitness_nutrition/src/presentation/bloc/meal_cubit/meal_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../../core/funtions/day_of_week.dart';
import '../../../../core/resource/app_colors.dart';
import '../../../../core/resource/app_dimens.dart';
import '../../../../core/resource/app_fonts.dart';

import '../../../bloc/infomation_cubit/infomation_cubit.dart';
import '../cubit/nutrition_screen/nutrition_screen_cubit_cubit.dart';
import '../widget/nutrition_widget.dart/calendar_item.dart';
import '../widget/nutrition_widget.dart/calories_widget.dart';
import '../widget/nutrition_widget.dart/water_widget.dart';

class NutritionScreen extends StatelessWidget {
  const NutritionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size sizeScreen = MediaQuery.of(context).size;
    final List<DateTime> listDateTime = getWeek(DateTime.now());
    return SafeArea(
      child: BlocBuilder<InfomationCubit, InfomationState>(
        builder: (context, stateInfo) {
          return BlocBuilder<NutritionScreenCubit, NutritionScreenCubitState>(
            builder: (context, stateNutriScreen) {
              return BlocBuilder<MealCubit, MealState>(
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppDimens.dimens_24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: AppDimens.dimens_28,
                          child: Row(
                            children: [
                              const Expanded(child: SizedBox()),
                              GestureDetector(
                                  onTap: () {
                                    context
                                        .read<NutritionScreenCubit>()
                                        .changeCalories();
                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.change_circle,
                                        size: AppDimens.dimens_28,
                                        color: stateNutriScreen.calories
                                            ? AppColor.pink
                                            : AppColor.blue,
                                      ),
                                      const SizedBox(
                                        width: AppDimens.dimens_5,
                                      ),
                                      Text(
                                          stateNutriScreen.calories
                                              ? 'Calories'
                                              : 'Water',
                                          style: const TextStyle(
                                            fontSize: AppDimens.dimens_18,
                                            fontWeight: AppFont.semiBold,
                                          ))
                                    ],
                                  ))
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: AppDimens.dimens_16,
                        ),
                        SizedBox(
                            height:
                                (sizeScreen.width - AppDimens.dimens_24 * 2) /
                                    7,
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                for (int i = 0; i < 7; i++)
                                  CalendarItemWidget(
                                      sizeScreen,
                                      listDateTime[i],
                                      i == stateNutriScreen.choose,
                                      i,
                                      stateNutriScreen.calories,
                                      true,
                                      false)
                              ],
                            )),
                        const SizedBox(
                          height: AppDimens.dimens_16,
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                              child: stateNutriScreen.calories
                                  ? CaloriesWidget(
                                      sizeScreen: sizeScreen,
                                      listInfomation: stateInfo.listInfomation,
                                      index: stateNutriScreen.choose,
                                    )
                                  : WaterWidget(
                                      sizeScreen: sizeScreen,
                                      water: stateNutriScreen.water,
                                      index: stateNutriScreen.choose,
                                      checkToday: listDateTime[
                                              stateNutriScreen.choose] ==
                                          DateTime.parse(
                                              DateFormat('yyyy-MM-dd')
                                                  .format(DateTime.now())),
                                      listDateTime: listDateTime,
                                    )),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
