import 'package:fitness_nutrition/src/core/resource/app_colors.dart';
import 'package:fitness_nutrition/src/core/resource/app_dimens.dart';
import 'package:fitness_nutrition/src/core/resource/app_fonts.dart';
import 'package:fitness_nutrition/src/domain/entities/activity.dart';
import 'package:fitness_nutrition/src/presentation/view/action/action_screen.dart';
import 'package:fitness_nutrition/src/presentation/view/action/cubit/timer_bloc/timer_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';

import '../../../widget/global/circular_progress.dart';

class RestWidget extends StatelessWidget {
  const RestWidget(this.activity, this.flutterTts, {super.key});
  final Activity activity;
  final FlutterTts flutterTts;
  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return SizedBox(
      width: sizeScreen.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Bắt đầu trong',
              style: TextStyle(
                  fontSize: AppDimens.dimens_24,
                  color: AppColor.black,
                  fontWeight: AppFont.semiBold)),
          const SizedBox(
            height: AppDimens.dimens_24,
          ),
          BlocBuilder<TimerCubit, TimerState>(builder: (context, state) {
            flutterTts.speak(state.duration.toString());
            return CircularPercentWidget(
                sizeScreen.width * 0.35,
                AppColor.pink,
                formatTime(state.duration),
                state.duration / state.durationBegin,
                AppDimens.dimens_32,
                AppFont.semiBold,
                0.2,
                AppDimens.dimens_12);
          })
        ],
      ),
    );
  }
}
