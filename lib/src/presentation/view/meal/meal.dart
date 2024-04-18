// ignore_for_file: use_build_context_synchronously

import 'package:fitness_nutrition/src/presentation/view/meal/widget/meals_data_item.dart';
import 'package:fitness_nutrition/src/presentation/view/meal/widget/meals_item_choose.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import '../../../core/resource/app_colors.dart';
import '../../../core/resource/app_dimens.dart';
import '../../../core/resource/app_string.dart';
import '../../../domain/entities/food.dart';
import '../../../domain/entities/meal.dart';
import '../../bloc/meal_cubit/meal_cubit.dart';
import '../../widget/global/back_button.dart';
import '../../widget/global/bottom_navigation_bar.dart';
import '../main/widget/nutrition_widget.dart/meal_ingredients.dart';
import '../../widget/global/text_field.dart';
import 'bloc/meal/meal_cubit.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppDimens.dimens_12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BackButtonWidget(() {
              Navigator.of(context).pop();
            }),
            Container(
              height: AppDimens.dimens_100,
              width: double.infinity,
              alignment: Alignment.center,
              margin: const EdgeInsets.only(bottom: AppDimens.dimens_16),
              padding: const EdgeInsets.all(AppDimens.dimens_8),
              decoration: BoxDecoration(
                  border: Border.all(
                      width: AppDimens.dimens_1,
                      color: AppColor.pink.withOpacity(0.5)),
                  borderRadius: BorderRadius.circular(AppDimens.dimens_16)),
              child: BlocBuilder<MealScreenCubit, MealScreenState>(
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: MealIngredientsWidget(
                              calories: valueMeal(
                                  state.listFoodChoosed, AppString.calories),
                              protein: valueMeal(
                                  state.listFoodChoosed, AppString.protein),
                              carb: valueMeal(
                                  state.listFoodChoosed, AppString.carb),
                              fat: valueMeal(
                                  state.listFoodChoosed, AppString.fat)))
                    ],
                  );
                },
              ),
            ),
            Expanded(
              child: BlocBuilder<MealScreenCubit, MealScreenState>(
                builder: (context, state) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: AppDimens.dimens_45 *
                              state.listFoodChoosed.length,
                          child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: state.listFoodChoosed.length,
                              itemBuilder: (context, index) => MealsItemChoose(
                                  state.listFoodChoosed[index], index)),
                        ),
                        const SizedBox(
                          height: AppDimens.dimens_16,
                        ),
                        TextFieldWidget((value) {
                          context.read<MealScreenCubit>().searchFood(value);
                        },
                            'Search',
                            TextInputType.text,
                            const Padding(
                              padding:
                                  EdgeInsets.only(left: AppDimens.dimens_8),
                              child: Icon(Icons.search),
                            ),
                            false),
                        const SizedBox(
                          height: AppDimens.dimens_24,
                        ),
                        SizedBox(
                          height: AppDimens.dimens_65 * state.listFood.length,
                          child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: state.listFood.length,
                              itemBuilder: (context, index) =>
                                  MealsDataItem(state.listFood, index)),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      )),
      bottomNavigationBar: BlocBuilder<MealScreenCubit, MealScreenState>(
        builder: (context, state) {
          return BlocListener<MealCubit, MealState>(
            listener: (context, stateCubit) {
              if (stateCubit.status == FormzSubmissionStatus.failure) {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: AppColor.black.withOpacity(0.6),
                    content: const Text('Có lỗi gì đó, hãy thử lại')));
                Navigator.of(context).pop();
              }
            },
            child: BottomNavigationBarWidget(() async {
              final Meal result = Meal(
                  dateTime: DateTime.now().toString(),
                  foods: state.listFoodChoosed);

              await context
                  .read<MealCubit>()
                  .enterMeal(result.toMap())
                  .then((value) => Navigator.of(context).pop());
            }, state.listFoodChoosed.isNotEmpty, AppString.continues),
          );
        },
      ),
    );
  }
}

double valueMeal(List<Map<double, Food>> listFood, String label) {
  double result = 0;
  for (int i = 0; i < listFood.length; i++) {
    switch (label) {
      case AppString.calories:
        result = result +
            listFood[i].keys.first * (listFood[i].values.first.calories) / 100;
      case AppString.protein:
        result = result +
            listFood[i].keys.first * (listFood[i].values.first.protein) / 100;
      case AppString.carb:
        result = result +
            listFood[i].keys.first * (listFood[i].values.first.carb) / 100;
      default:
        result = result +
            listFood[i].keys.first * (listFood[i].values.first.fat) / 100;
    }
  }
  return result;
}
