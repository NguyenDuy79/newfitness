import 'package:flutter/material.dart';

import '../../../../../core/resource/app_dimens.dart';
import '../../../../../core/resource/app_fonts.dart';

class TrainingDayWidget extends StatelessWidget {
  const TrainingDayWidget(this.dayTraining, this.describe, {super.key});
  final String dayTraining;
  final String describe;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(AppDimens.dimens_16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            dayTraining,
            style: const TextStyle(
                fontSize: AppDimens.dimens_32, fontWeight: AppFont.semiBold),
          ),
          FittedBox(
            child: Text(
              describe,
              style: const TextStyle(fontSize: AppDimens.dimens_24),
            ),
          )
        ],
      ),
    );
  }
}
