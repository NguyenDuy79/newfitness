import 'package:flutter/material.dart';

import '../../../../../core/resource/app_colors.dart';
import '../../../../../core/resource/app_dimens.dart';

class MainBottomWidget extends StatelessWidget {
  const MainBottomWidget(
      this.currentPage, this.function, this.text, this.icon, this.thisPage,
      {super.key});
  final int currentPage;
  final Function() function;
  final int thisPage;
  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: SizedBox(
        width: AppDimens.dimens_60,
        height: AppDimens.dimens_105,
        child: currentPage == thisPage
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: AppDimens.dimens_24,
                    width: AppDimens.dimens_52,
                    child: Center(
                      child: Text(
                        text,
                        style: const TextStyle(fontSize: AppDimens.dimens_14),
                      ),
                    ),
                  ),
                  Container(
                    height: AppDimens.dimens_4,
                    width: AppDimens.dimens_4,
                    decoration: const BoxDecoration(
                        color: AppColor.red, shape: BoxShape.circle),
                  )
                ],
              )
            : Icon(
                icon,
                size: AppDimens.dimens_24,
              ),
      ),
    );
  }
}
