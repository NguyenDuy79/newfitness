import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:intl/intl.dart';

import '../../../../../config/route/route_generator_route.dart';
import '../../../../../core/funtions/calculate_calories.dart';
import '../../../../../core/resource/app_colors.dart';
import '../../../../../core/resource/app_dimens.dart';
import '../../../../../core/resource/app_fonts.dart';
import '../../../../../core/resource/app_string.dart';

import '../../../../../domain/entities/infomation.dart';
import '../../../../bloc/infomation_cubit/infomation_cubit.dart';
import '../../bloc/cubit/infomation_body_dart_cubit.dart';

class RatioNutrition extends StatelessWidget {
  const RatioNutrition({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: AppDimens.dimens_12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppDimens.dimens_8, vertical: AppDimens.dimens_8),
              child: GestureDetector(
                  onTap: () {
                    context.read<InfomationBodyDartCubit>().changeIndex(7);
                  },
                  child: const Icon(Icons.arrow_back_ios)),
            ),
            const SizedBox(
              height: AppDimens.dimens_16,
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: [
                        const Text(
                          AppString.protein,
                          style: TextStyle(
                              fontSize: AppDimens.dimens_28,
                              fontWeight: AppFont.semiBold),
                        ),
                        Expanded(
                          child: BlocBuilder<InfomationBodyDartCubit,
                              InfomationBodyDartState>(
                            builder: (context, state) {
                              return CupertinoPicker(
                                  scrollController: FixedExtentScrollController(
                                    initialItem: context.select(
                                            (InfomationBodyDartCubit cubit) =>
                                                cubit.state.protein) -
                                        10,
                                  ),
                                  itemExtent: 32.0,
                                  onSelectedItemChanged: (int index) {
                                    context
                                        .read<InfomationBodyDartCubit>()
                                        .setProtein(index + 10);
                                  },
                                  children: listItem(AppString.protein));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const Text(
                          AppString.carb,
                          style: TextStyle(
                              fontSize: AppDimens.dimens_28,
                              fontWeight: AppFont.semiBold),
                        ),
                        Expanded(
                          child: BlocBuilder<InfomationBodyDartCubit,
                              InfomationBodyDartState>(
                            builder: (context, state) {
                              return CupertinoPicker(
                                  scrollController: FixedExtentScrollController(
                                    initialItem: state.carbs,
                                  ),
                                  itemExtent: 32.0,
                                  onSelectedItemChanged: (int index) {
                                    context
                                        .read<InfomationBodyDartCubit>()
                                        .setCarb(index);
                                  },
                                  children: listItem(AppString.carb));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: Column(
                    children: [
                      const Text(
                        AppString.fat,
                        style: TextStyle(
                            fontSize: AppDimens.dimens_28,
                            fontWeight: AppFont.semiBold),
                      ),
                      Expanded(
                        child: BlocBuilder<InfomationBodyDartCubit,
                            InfomationBodyDartState>(
                          builder: (context, state) {
                            return CupertinoPicker(
                                scrollController: FixedExtentScrollController(
                                  initialItem: context.select(
                                          (InfomationBodyDartCubit cubit) =>
                                              cubit.state.fat) -
                                      20,
                                ),
                                itemExtent: 32.0,
                                onSelectedItemChanged: (int index) {
                                  context
                                      .read<InfomationBodyDartCubit>()
                                      .setFat(index + 20);
                                },
                                children: listItem(AppString.fat));
                          },
                        ),
                      ),
                    ],
                  )),
                ],
              ),
            ),
            const SizedBox(
              height: AppDimens.dimens_16,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: AppDimens.dimens_20),
              child: Text(
                'Chọn sao cho cộng 3 giá trị lại vừa đủ 100%',
                style: TextStyle(
                    fontSize: AppDimens.dimens_18,
                    fontWeight: AppFont.semiBold),
              ),
            ),
            const SizedBox(
              height: AppDimens.dimens_16,
            ),
            BlocBuilder<InfomationBodyDartCubit, InfomationBodyDartState>(
              builder: (context, state) {
                final calories = getCalories(
                    state.bodyFat, state.weight, state.dayTraining, state.goal);
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppDimens.dimens_16),
                      child: Center(
                          child: Text(
                        'Hiện tại: ${state.protein + state.fat + state.carbs}%',
                        style: const TextStyle(
                            fontSize: AppDimens.dimens_24,
                            fontWeight: AppFont.semiBold),
                      )),
                    ),
                    const SizedBox(
                      height: AppDimens.dimens_16,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppDimens.dimens_16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Protein ${(calories * state.protein / 100 / 4).toStringAsFixed(1)}g',
                            style:
                                const TextStyle(fontSize: AppDimens.dimens_16),
                          ),
                          Text(
                              'Fat ${(calories * state.fat / 100 / 9).toStringAsFixed(1)}g',
                              style: const TextStyle(
                                  fontSize: AppDimens.dimens_16)),
                          Text(
                              'Carbs ${(calories * state.carbs / 100 / 4).toStringAsFixed(1)}g',
                              style: const TextStyle(
                                  fontSize: AppDimens.dimens_16))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: AppDimens.dimens_16,
                    ),
                    Center(
                      child: Text(
                        'Lượng calo hiện tại: ${((calories * state.protein / 100 + calories * state.fat / 100 + calories * state.carbs / 100)).toStringAsFixed(1)} calo',
                        style: const TextStyle(
                            fontSize: AppDimens.dimens_16,
                            fontWeight: AppFont.semiBold),
                      ),
                    ),
                    const SizedBox(
                      height: AppDimens.dimens_16,
                    ),
                    Center(
                      child: Text(
                        'Lượng calo cần nạp: ${calories.toStringAsFixed(1)} calo',
                        style: const TextStyle(
                            fontSize: AppDimens.dimens_16,
                            fontWeight: AppFont.semiBold),
                      ),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(
              height: AppDimens.dimens_16,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
            right: AppDimens.dimens_24,
            left: AppDimens.dimens_24,
            bottom: AppDimens.dimens_12),
        child: BlocConsumer<InfomationCubit, InfomationState>(
          listener: (context, stateInfo) {
            if (stateInfo.status == FormzSubmissionStatus.inProgress) {
              showLoadingDialog(context);
            }
            if (stateInfo.status == FormzSubmissionStatus.failure) {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: AppColor.black.withOpacity(0.6),
                  content: const Text('Có lỗi gì đó, hãy thử lại')));
              Navigator.of(context).pop();
            }
            if (stateInfo.listInfomation.isNotEmpty) {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  RouteGenerator.mainScreen, (route) => false);
            }
          },
          builder: (context, stateInfo) {
            return BlocConsumer<InfomationBodyDartCubit,
                InfomationBodyDartState>(
              listener: (context, state) {},
              builder: (context, state) {
                return GestureDetector(
                  onTap: () async {
                    if ((state.protein + state.fat + state.carbs) == 100) {
                      Infomation info = Infomation(
                          dateTime:
                              DateFormat('yyyy-MM-dd').format(DateTime.now()),
                          gender: state.gender,
                          goal: state.goal,
                          bodyFat: state.bodyFat,
                          dateOfBirth: state.dateOfBirth,
                          height: state.height,
                          weight: state.weight,
                          dayTraining: state.dayTraining,
                          protein: state.protein,
                          carbs: state.carbs,
                          fat: state.fat);

                      context
                          .read<InfomationCubit>()
                          .enterInfomation(info.toMap());
                    }
                  },
                  child: Container(
                    height: AppDimens.dimens_45,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color:
                            ((state.protein + state.fat + state.carbs) == 100)
                                ? AppColor.pink.withOpacity(0.8)
                                : AppColor.grey,
                        borderRadius:
                            BorderRadius.circular(AppDimens.dimens_16)),
                    child: const Text(
                      'Bắt đầu tập',
                      style: TextStyle(
                          fontSize: AppDimens.dimens_28,
                          fontWeight: AppFont.semiBold,
                          color: AppColor.white),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

List<Widget> listItem(String nutri) {
  List<Widget> list = [];
  for (int i = nutri == AppString.protein
          ? 10
          : nutri == AppString.fat
              ? 20
              : 0;
      i < 100;
      i++) {
    list.add(Text(i.toString()));
  }

  return list;
}

void showLoadingDialog(BuildContext context) {
  showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => const CupertinoAlertDialog(
            content: CupertinoActivityIndicator(
                radius: 20.0, color: CupertinoColors.activeBlue),
          ));
}
