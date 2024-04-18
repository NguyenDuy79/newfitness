import 'package:fitness_nutrition/src/presentation/view/schedule/cubit/schedule_screen_cubit/schedule_screen_cubit.dart';
import 'package:fitness_nutrition/src/presentation/view/schedule/widget/cardio/cardio_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/resource/app_dimens.dart';
import '../../../../../core/resource/app_fonts.dart';
import '../../../../../core/resource/app_string.dart';

class ChooseCardioMethod extends StatelessWidget {
  const ChooseCardioMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Chọn phương pháp cardio',
          style: TextStyle(
              fontSize: AppDimens.dimens_24, fontWeight: AppFont.semiBold),
        ),
        const SizedBox(
          height: AppDimens.dimens_16,
        ),
        GestureDetector(
            onTap: () {
              context
                  .read<ScheduleScreenMainCubit>()
                  .setCardioMethod(AppString.hittCardio);
            },
            child: const CardioButtonWidget(AppString.hittCardio)),
        const SizedBox(
          height: AppDimens.dimens_10,
        ),
        GestureDetector(
            onTap: () {
              context
                  .read<ScheduleScreenMainCubit>()
                  .setCardioMethod(AppString.lissCardio);
            },
            child: const CardioButtonWidget(AppString.lissCardio))
      ],
    );
  }
}
