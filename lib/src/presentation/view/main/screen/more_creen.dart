import 'package:flutter/material.dart';

import '../../../../core/resource/app_assets.dart';
import '../../../../core/resource/app_colors.dart';
import '../../../../core/resource/app_dimens.dart';
import '../../../../core/resource/app_fonts.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size sizeScreen = MediaQuery.of(context).size;
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(AppDimens.dimens_24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: AppDimens.dimens_58,
            width: AppDimens.dimens_58,
            child: CircleAvatar(
              backgroundColor: AppColor.pink.withOpacity(0.3),
              backgroundImage: const AssetImage(AppAssets.user),
            ),
          ),
          const SizedBox(
            height: AppDimens.dimens_16,
          ),
          Row(
            children: [
              Container(
                height: AppDimens.dimens_40,
                width: sizeScreen.width * 0.5 -
                    AppDimens.dimens_24 -
                    AppDimens.dimens_8,
                padding: const EdgeInsets.symmetric(
                    vertical: AppDimens.dimens_4,
                    horizontal: AppDimens.dimens_8),
                decoration: BoxDecoration(
                    border: Border.all(
                      width: AppDimens.dimens_1,
                      color: AppColor.pink.withOpacity(0.3),
                    ),
                    borderRadius: BorderRadius.circular(AppDimens.dimens_16)),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.person_2_outlined,
                      color: AppColor.black,
                      size: AppDimens.dimens_24,
                    ),
                    SizedBox(
                      width: AppDimens.dimens_5,
                    ),
                    Text(
                      'Hồ sơ',
                      style: TextStyle(
                          fontSize: AppDimens.dimens_18,
                          fontWeight: AppFont.semiBold),
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: AppDimens.dimens_16,
              ),
              Container(
                height: AppDimens.dimens_40,
                width: sizeScreen.width * 0.5 -
                    AppDimens.dimens_24 -
                    AppDimens.dimens_8,
                padding: const EdgeInsets.symmetric(
                    vertical: AppDimens.dimens_4,
                    horizontal: AppDimens.dimens_8),
                decoration: BoxDecoration(
                    border: Border.all(
                      width: AppDimens.dimens_1,
                      color: AppColor.pink.withOpacity(0.3),
                    ),
                    borderRadius: BorderRadius.circular(AppDimens.dimens_16)),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.person_2_outlined,
                      color: AppColor.black,
                      size: AppDimens.dimens_24,
                    ),
                    SizedBox(
                      width: AppDimens.dimens_5,
                    ),
                    Text(
                      'Hồ sơ',
                      style: TextStyle(
                          fontSize: AppDimens.dimens_18,
                          fontWeight: AppFont.semiBold),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}
