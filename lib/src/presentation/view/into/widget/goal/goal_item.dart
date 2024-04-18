import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/resource/app_colors.dart';
import '../../../../../core/resource/app_dimens.dart';
import '../../../../../core/resource/app_fonts.dart';
import '../../../../../core/resource/app_string.dart';
import '../../bloc/cubit/infomation_body_dart_cubit.dart';

class GoalItem extends StatelessWidget {
  const GoalItem(this.goal, this.intoduce, this.function, {super.key});
  final String intoduce;
  final String goal;
  final Function() function;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppDimens.dimens_16),
        child: GestureDetector(
          onTap: function,
          child: BlocBuilder<InfomationBodyDartCubit, InfomationBodyDartState>(
            builder: (context, state) {
              return AnimatedContainer(
                height: AppDimens.dimens_100,
                width: double.infinity,
                duration: const Duration(milliseconds: 250),
                padding: state.goal == goal
                    ? EdgeInsets.symmetric(
                        horizontal: state.widthtWidget,
                        vertical: state.heightWidget)
                    : const EdgeInsets.all(0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppDimens.dimens_24),
                      color:
                          state.goal == goal ? AppColor.pink : AppColor.white,
                      border: Border.all(
                          width: AppDimens.dimens_1,
                          color: state.goal == goal
                              ? AppColor.white
                              : AppColor.pink.withOpacity(0.5))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        goal == AppString.maintenance ? 'Giữ nguyên' : goal,
                        style: TextStyle(
                            fontSize: AppDimens.dimens_24,
                            fontWeight: AppFont.semiBold,
                            color: state.goal == goal
                                ? AppColor.white
                                : AppColor.black),
                      ),
                      if (goal != AppString.maintenance)
                        Row(
                          children: [
                            const SizedBox(
                              width: AppDimens.dimens_15,
                            ),
                            Expanded(
                              child: Text(
                                intoduce,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: state.goal == goal
                                        ? AppColor.white
                                        : AppColor.black),
                              ),
                            ),
                            const SizedBox(
                              width: AppDimens.dimens_15,
                            ),
                          ],
                        )
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }
}
