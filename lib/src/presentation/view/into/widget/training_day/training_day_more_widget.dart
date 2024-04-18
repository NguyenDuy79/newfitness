import 'package:flutter/material.dart';

import '../../../../../core/resource/app_colors.dart';
import '../../../../../core/resource/app_dimens.dart';

class TrainingDayMoreWidget extends StatelessWidget {
  const TrainingDayMoreWidget(this.width, this.more, {super.key});
  final double width;
  final String more;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width - AppDimens.dimens_32,
      padding: const EdgeInsets.all(AppDimens.dimens_16),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border.all(
              width: AppDimens.dimens_1, color: AppColor.pink.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(AppDimens.dimens_24)),
      child: Text(more,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: AppDimens.dimens_20)),
    );
  }
}
