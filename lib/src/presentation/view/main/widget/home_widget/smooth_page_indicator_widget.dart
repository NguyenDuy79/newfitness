import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/resource/app_colors.dart';
import '../../../../../core/resource/app_dimens.dart';

class SmoothPageIndicatorWidget extends StatelessWidget {
  const SmoothPageIndicatorWidget(this.screenSize, this.controller,
      {super.key});
  final Size screenSize;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height:
          (screenSize.width - AppDimens.dimens_24 * 2 - AppDimens.dimens_15) /
              2 *
              0.75,
      alignment: const Alignment(0, -0.6),
      child: SmoothPageIndicator(
        axisDirection: Axis.vertical,
        controller: controller,
        count: 2,
        effect: WormEffect(
            strokeWidth: AppDimens.dimens_0,
            dotColor: AppColor.blue.withOpacity(0.5),
            dotHeight: AppDimens.dimens_5,
            dotWidth: AppDimens.dimens_10,
            activeDotColor: AppColor.pink,
            spacing: AppDimens.dimens_10,
            paintStyle: PaintingStyle.fill),
      ),
    );
  }
}
