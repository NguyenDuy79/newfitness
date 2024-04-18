import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/resource/app_colors.dart';
import '../../../../../core/resource/app_dimens.dart';
import '../../../../../core/resource/app_fonts.dart';
import '../../bloc/cubit/infomation_body_dart_cubit.dart';

class ChooseWeightWidget extends StatelessWidget {
  const ChooseWeightWidget({super.key});

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
                    context.read<InfomationBodyDartCubit>().changeIndex(5);
                  },
                  child: const Icon(Icons.arrow_back_ios)),
            ),
            const SizedBox(
              height: AppDimens.dimens_16,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: AppDimens.dimens_16),
              child: Center(
                child: Text(
                  'Cân nặng của bạn là bao nhiêu ?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: AppDimens.dimens_24,
                      fontWeight: AppFont.semiBold),
                ),
              ),
            ),
            const SizedBox(
              height: AppDimens.dimens_16,
            ),
            BlocBuilder<InfomationBodyDartCubit, InfomationBodyDartState>(
              builder: (context, state) {
                FixedExtentScrollController scrollController1 =
                    FixedExtentScrollController(
                        initialItem: state.kg
                            ? state.startChooseWeightKg
                            : state.startChooseWeightIbs);
                return Expanded(
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                            height: AppDimens.dimens_45,
                            width: AppDimens.dimens_150,
                            decoration: BoxDecoration(
                                color: AppColor.grey,
                                borderRadius:
                                    BorderRadius.circular(AppDimens.dimens_24)),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    scrollController1
                                        .jumpToItem(state.startChooseWeightKg);
                                    context
                                        .read<InfomationBodyDartCubit>()
                                        .setWeight(
                                            state.startChooseWeightKg / 10 +
                                                61);

                                    context
                                        .read<InfomationBodyDartCubit>()
                                        .changeKg(true);
                                  },
                                  child: Container(
                                    height: AppDimens.dimens_45,
                                    width: AppDimens.dimens_75,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: state.kg
                                            ? AppColor.pink
                                            : AppColor.grey,
                                        borderRadius: BorderRadius.circular(
                                            AppDimens.dimens_24)),
                                    child: Text(
                                      'kg',
                                      style: TextStyle(
                                          fontSize: AppDimens.dimens_24,
                                          color: state.kg
                                              ? AppColor.white
                                              : AppColor.black,
                                          fontWeight: AppFont.semiBold),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    scrollController1
                                        .jumpToItem(state.startChooseWeightIbs);
                                    context
                                        .read<InfomationBodyDartCubit>()
                                        .setWeight(state.startChooseWeightIbs /
                                                22.046 +
                                            61);

                                    context
                                        .read<InfomationBodyDartCubit>()
                                        .changeKg(false);
                                  },
                                  child: Container(
                                    height: AppDimens.dimens_45,
                                    width: AppDimens.dimens_75,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: state.kg
                                            ? AppColor.grey
                                            : AppColor.pink,
                                        borderRadius: BorderRadius.circular(
                                            AppDimens.dimens_24)),
                                    child: Text(
                                      'ibs',
                                      style: TextStyle(
                                          fontSize: AppDimens.dimens_24,
                                          color: state.kg
                                              ? AppColor.black
                                              : AppColor.white,
                                          fontWeight: AppFont.semiBold),
                                    ),
                                  ),
                                )
                              ],
                            )),
                      ),
                      const SizedBox(
                        height: AppDimens.dimens_16,
                      ),
                      Expanded(
                          child: CupertinoPicker(
                              magnification: 1,
                              useMagnifier: true,
                              scrollController: scrollController1,
                              itemExtent: AppDimens.dimens_40,
                              offAxisFraction: 0,
                              onSelectedItemChanged: (value) {
                                state.kg
                                    ? context
                                        .read<InfomationBodyDartCubit>()
                                        .setWeight(value / 10 + 61)
                                    : context
                                        .read<InfomationBodyDartCubit>()
                                        .setWeight(value / 22 + 61);
                              },
                              children:
                                  state.kg ? listWeighKg() : listWeighIbs()))
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
            right: AppDimens.dimens_24,
            left: AppDimens.dimens_24,
            bottom: AppDimens.dimens_12),
        child: GestureDetector(
          onTap: () {
            context.read<InfomationBodyDartCubit>().changeIndex(7);
          },
          child: Container(
            height: AppDimens.dimens_45,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: AppColor.pink.withOpacity(0.8),
                borderRadius: BorderRadius.circular(AppDimens.dimens_16)),
            child: const Text(
              'Tiếp theo',
              style: TextStyle(
                  fontSize: AppDimens.dimens_28,
                  fontWeight: AppFont.semiBold,
                  color: AppColor.white),
            ),
          ),
        ),
      ),
    );
  }
}

List<Widget> listWeighKg() {
  List<Widget> newList = [];
  for (int i = 0; i < 1891; i++) {
    newList.add(Text(
      (61 + 0.1 * i).toStringAsFixed(1),
      style: const TextStyle(
          fontSize: AppDimens.dimens_24,
          fontWeight: AppFont.semiBold,
          color: AppColor.pink),
    ));
  }
  return newList;
}

List<Widget> listWeighIbs() {
  List<Widget> newList = [];
  for (int i = 0; i < 3807; i++) {
    newList.add(Text(
      (134.5 + 0.1 * i).toStringAsFixed(1),
      style: const TextStyle(
          fontSize: AppDimens.dimens_24,
          fontWeight: AppFont.semiBold,
          color: AppColor.pink),
    ));
  }
  return newList;
}
