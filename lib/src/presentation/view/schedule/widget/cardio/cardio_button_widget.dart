import 'package:flutter/material.dart';

import '../../../../../core/resource/app_colors.dart';
import '../../../../../core/resource/app_dimens.dart';
import '../../../../../core/resource/app_fonts.dart';

class CardioButtonWidget extends StatelessWidget {
  const CardioButtonWidget(this.text, {super.key});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimens.dimens_45,
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColor.white,
          border: Border.all(width: AppDimens.dimens_1, color: AppColor.pink),
          borderRadius: BorderRadius.circular(AppDimens.dimens_16)),
      alignment: Alignment.center,
      child: Text(
        text,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: AppDimens.dimens_20,
          fontWeight: AppFont.medium,
        ),
      ),
    );
  }
}
