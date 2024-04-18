import 'package:flutter/material.dart';

import '../../../core/resource/app_colors.dart';
import '../../../core/resource/app_dimens.dart';
import '../../../core/resource/app_fonts.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(this.check, this.text, {super.key});
  final bool check;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: AppDimens.dimens_45,
      decoration: BoxDecoration(
          color: check ? AppColor.white : AppColor.pink,
          border: Border.all(width: AppDimens.dimens_1, color: AppColor.pink),
          borderRadius: BorderRadius.circular(AppDimens.dimens_16)),
      child: Text(
        text,
        style: TextStyle(
          fontSize: AppDimens.dimens_16,
          fontWeight: AppFont.semiBold,
          color: check ? AppColor.black : AppColor.white,
        ),
      ),
    );
  }
}
