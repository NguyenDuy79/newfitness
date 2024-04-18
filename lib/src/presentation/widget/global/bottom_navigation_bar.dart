import 'package:flutter/material.dart';

import '../../../core/resource/app_colors.dart';
import '../../../core/resource/app_dimens.dart';
import '../../../core/resource/app_fonts.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget(this.function, this.checkValid, this.text,
      {super.key});
  final Function() function;
  final bool checkValid;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          right: AppDimens.dimens_24,
          left: AppDimens.dimens_24,
          bottom: AppDimens.dimens_12),
      child: GestureDetector(
        onTap: checkValid ? function : () {},
        child: Container(
          height: AppDimens.dimens_45,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color:
                  checkValid ? AppColor.pink.withOpacity(0.8) : AppColor.grey,
              borderRadius: BorderRadius.circular(AppDimens.dimens_16)),
          child: Text(
            text,
            style: const TextStyle(
                fontSize: AppDimens.dimens_28,
                fontWeight: AppFont.semiBold,
                color: AppColor.white),
          ),
        ),
      ),
    );
  }
}
