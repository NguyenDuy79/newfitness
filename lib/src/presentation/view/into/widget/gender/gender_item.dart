import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/resource/app_colors.dart';
import '../../../../../core/resource/app_dimens.dart';
import '../../../../../core/resource/app_fonts.dart';
import '../../../../../core/resource/app_string.dart';
import '../../bloc/cubit/infomation_body_dart_cubit.dart';

class GenderWidget extends StatelessWidget {
  const GenderWidget(
      this.gender, this.genderState, this.sizeScreen, this.heightWidget,
      {super.key});
  final String gender;
  final String genderState;
  final Size sizeScreen;
  final double heightWidget;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await context
            .read<InfomationBodyDartCubit>()
            .setGender(gender == 'Male' ? AppString.male : AppString.female);
        Future.delayed(const Duration(milliseconds: 500), () {
          if (genderState == '') {
            context.read<InfomationBodyDartCubit>().changeIndex(2);
          }
        });
      },
      child: AnimatedContainer(
        width: (sizeScreen.width / 2 - AppDimens.dimens_16),
        height: (sizeScreen.width / 2 - AppDimens.dimens_16) * 1.5,
        duration: const Duration(milliseconds: 250),
        padding: EdgeInsets.all(genderState ==
                (gender == 'Male' ? AppString.male : AppString.female)
            ? heightWidget
            : 0),
        child: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: AppDimens.dimens_8, vertical: AppDimens.dimens_16),
          decoration: BoxDecoration(
              border: Border.all(
                  width: AppDimens.dimens_1,
                  color: genderState ==
                          (gender == 'Male' ? AppString.male : AppString.female)
                      ? AppColor.white
                      : AppColor.pink.withOpacity(0.5)),
              color: genderState ==
                      (gender == 'Male' ? AppString.male : AppString.female)
                  ? AppColor.pink
                  : AppColor.white,
              borderRadius: BorderRadius.circular(AppDimens.dimens_24)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Icon(
                  gender == 'Male' ? Icons.male : Icons.female,
                  size: (sizeScreen.width / 2 -
                      AppDimens.dimens_16 -
                      AppDimens.dimens_36),
                  color: genderState ==
                          (gender == 'Male' ? AppString.male : AppString.female)
                      ? AppColor.white
                      : AppColor.pink,
                ),
              ),
              const SizedBox(
                height: AppDimens.dimens_16,
              ),
              Text(
                gender,
                style: TextStyle(
                    fontSize: AppDimens.dimens_24,
                    fontWeight: AppFont.semiBold,
                    color: genderState ==
                            (gender == 'Male'
                                ? AppString.male
                                : AppString.female)
                        ? AppColor.white
                        : AppColor.black),
              ),
              const SizedBox(
                height: AppDimens.dimens_16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
