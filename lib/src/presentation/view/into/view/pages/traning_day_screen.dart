import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/resource/app_colors.dart';
import '../../../../../core/resource/app_dimens.dart';
import '../../../../../core/resource/app_fonts.dart';
import '../../../../../core/resource/app_string.dart';
import '../../bloc/cubit/infomation_body_dart_cubit.dart';
import '../../widget/training_day/training_day_more_widget.dart';
import '../../widget/training_day/training_day_widget.dart';

class ChoooseTrainingDay extends StatelessWidget {
  const ChoooseTrainingDay({super.key});

  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: AppDimens.dimens_12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppDimens.dimens_8,
                    vertical: AppDimens.dimens_8),
                child: GestureDetector(
                    onTap: () {
                      context.read<InfomationBodyDartCubit>().changeIndex(6);
                    },
                    child: const Icon(Icons.arrow_back_ios)),
              ),
              const SizedBox(
                height: AppDimens.dimens_16,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: AppDimens.dimens_16),
                child: Center(
                  child: Text(
                    'Bạn có thể tập luyện bao nhiêu ngày một tuần ?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: AppDimens.dimens_24,
                        fontWeight: AppFont.semiBold),
                  ),
                ),
              ),
              const SizedBox(
                height: AppDimens.dimens_16,
              ),
              BlocBuilder<InfomationBodyDartCubit, InfomationBodyDartState>(
                builder: (context, state) {
                  final PageController pageController =
                      PageController(initialPage: getIndex(state.dayTraining));
                  return Column(
                    children: [
                      SizedBox(
                        height: AppDimens.dimens_200,
                        child: PageView(
                          controller: pageController,
                          onPageChanged: (value) {
                            context
                                .read<InfomationBodyDartCubit>()
                                .setDayTraining(
                                    AppString.listDayTraining[value]);
                          },
                          children: [
                            for (int i = 0; i <= 4; i++)
                              TrainingDayWidget(AppString.listDayTraining[i],
                                  AppString.listDecribeDayTraining[i])
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: AppDimens.dimens_32,
                      ),
                      Center(
                        child: SmoothPageIndicator(
                          axisDirection: Axis.horizontal,
                          controller: pageController,
                          count: 5,
                          effect: ExpandingDotsEffect(
                              strokeWidth: AppDimens.dimens_0,
                              dotColor: AppColor.blue.withOpacity(0.5),
                              dotHeight: AppDimens.dimens_8,
                              dotWidth: AppDimens.dimens_8,
                              activeDotColor: AppColor.pink,
                              spacing: AppDimens.dimens_10,
                              paintStyle: PaintingStyle.fill),
                        ),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(
                height: AppDimens.dimens_48,
              ),
              BlocBuilder<InfomationBodyDartCubit, InfomationBodyDartState>(
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppDimens.dimens_16),
                    child: more(sizeScreen.width)[getIndex(state.dayTraining)],
                  );
                },
              ),
              const SizedBox(
                height: AppDimens.dimens_24,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(
              right: AppDimens.dimens_24,
              left: AppDimens.dimens_24,
              bottom: AppDimens.dimens_12),
          child: GestureDetector(
            onTap: () {
              context.read<InfomationBodyDartCubit>().changeIndex(8);
            },
            child: Container(
              height: AppDimens.dimens_45,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: AppColor.pink.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(AppDimens.dimens_16)),
              child: const Text(
                'Tiếp theo',
                style: TextStyle(
                    fontSize: AppDimens.dimens_28,
                    fontWeight: AppFont.semiBold,
                    color: AppColor.white),
              ),
            ),
          )),
    );
  }
}

List<Widget> more(double width) {
  return [
    for (int i = 0; i <= 4; i++)
      TrainingDayMoreWidget(width, AppString.listMoreTrainingDay[i])
  ];
}

int getIndex(String value) {
  switch (value) {
    case AppString.dayTraining1:
      return 0;
    case AppString.dayTraining2:
      return 1;
    case AppString.dayTraining3:
      return 2;
    case AppString.dayTraining4:
      return 3;
    default:
      return 4;
  }
}
