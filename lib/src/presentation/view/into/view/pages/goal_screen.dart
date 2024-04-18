import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/resource/app_colors.dart';
import '../../../../../core/resource/app_dimens.dart';
import '../../../../../core/resource/app_fonts.dart';
import '../../../../../core/resource/app_string.dart';
import '../../bloc/cubit/infomation_body_dart_cubit.dart';
import '../../widget/goal/goal_item.dart';

class MainGoalScreen extends StatelessWidget {
  const MainGoalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: ,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: AppDimens.dimens_12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppDimens.dimens_8),
                  child: IconButton(
                      onPressed: () {
                        context.read<InfomationBodyDartCubit>().changeIndex(1);
                      },
                      icon: const Icon(Icons.arrow_back_ios)),
                ),
                const SizedBox(
                  height: AppDimens.dimens_16,
                ),
                const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: AppDimens.dimens_16),
                  child: Center(
                    child: Text(
                      'Mục tiêu chính của bạn là gì ?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: AppDimens.dimens_24,
                          fontWeight: AppFont.semiBold),
                    ),
                  ),
                ),
                for (int i = 0; i < 3; i++)
                  Column(
                    children: [
                      const SizedBox(
                        height: AppDimens.dimens_16,
                      ),
                      BlocBuilder<InfomationBodyDartCubit,
                          InfomationBodyDartState>(
                        builder: (context, state) {
                          return GoalItem(
                            AppString.listGoal[i],
                            AppString.listGoalIntoduce[i],
                            () {
                              context
                                  .read<InfomationBodyDartCubit>()
                                  .setGoal(AppString.listGoal[i]);
                              Future.delayed(const Duration(milliseconds: 500),
                                  () {
                                if (state.goal == '') {
                                  context
                                      .read<InfomationBodyDartCubit>()
                                      .changeIndex(3);
                                }
                              });
                            },
                          );
                        },
                      ),
                    ],
                  ),

                const SizedBox(
                  height: AppDimens.dimens_16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppDimens.dimens_16),
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(children: [
                        TextSpan(
                            text: 'Tip: ',
                            style: TextStyle(
                                fontWeight: AppFont.semiBold,
                                color: AppColor.black)),
                        TextSpan(
                            text: AppString.tipGoal,
                            style: TextStyle(color: AppColor.black))
                      ])),
                ),
                const SizedBox(
                  height: AppDimens.dimens_16,
                )
                //   const Expanded(flex: 1, child: SizedBox()),
              ],
            ),
          ),
        ),
        bottomNavigationBar:
            BlocBuilder<InfomationBodyDartCubit, InfomationBodyDartState>(
          builder: (context, state) {
            return state.goal == ''
                ? const SizedBox()
                : Padding(
                    padding: const EdgeInsets.only(
                        right: AppDimens.dimens_24,
                        left: AppDimens.dimens_24,
                        bottom: AppDimens.dimens_12),
                    child: GestureDetector(
                      onTap: () {
                        context.read<InfomationBodyDartCubit>().changeIndex(3);
                      },
                      child: Container(
                        height: AppDimens.dimens_45,
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: AppColor.pink.withOpacity(0.8),
                            borderRadius:
                                BorderRadius.circular(AppDimens.dimens_16)),
                        child: const Text(
                          'Tiếp theo',
                          style: TextStyle(
                              fontSize: AppDimens.dimens_28,
                              fontWeight: AppFont.semiBold,
                              color: AppColor.white),
                        ),
                      ),
                    ),
                  );
          },
        ));
  }
}
