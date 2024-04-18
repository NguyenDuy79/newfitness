import 'package:flutter/material.dart';

import '../../../../../core/resource/app_colors.dart';
import '../../../../../core/resource/app_dimens.dart';
import '../../../../../core/resource/app_fonts.dart';

class ListPageWidget extends StatelessWidget {
  const ListPageWidget(
      this.screenSize, this.name, this.unit, this.value, this.icon, this.image,
      {super.key});
  final Size screenSize;
  final String name;
  final String unit;
  final String value;
  final String image;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width:
          (screenSize.width - AppDimens.dimens_24 * 2 - AppDimens.dimens_15) /
              2,
      height:
          (screenSize.width - AppDimens.dimens_24 * 2 - AppDimens.dimens_15) /
              2 *
              0.75,
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimens.dimens_16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: AppDimens.dimens_24,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                      fontWeight: AppFont.semiBold,
                      fontSize: AppDimens.dimens_14),
                ),
                image != ''
                    ? Image.asset(
                        image,
                        color: AppColor.pink,
                      )
                    : Icon(
                        icon!,
                        color: AppColor.pink,
                      )
              ],
            ),
          ),
          const SizedBox(
            height: AppDimens.dimens_16,
          ),
          Text(
            value,
            style: const TextStyle(
                fontWeight: AppFont.bold, fontSize: AppDimens.dimens_18),
          ),
          Text(
            unit,
            style: TextStyle(
                fontSize: AppDimens.dimens_12,
                color: AppColor.black.withOpacity(0.4)),
          ),
        ],
      ),
    );
  }
}
