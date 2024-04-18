import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/resource/app_assets.dart';
import '../../../../../core/resource/app_colors.dart';
import '../../../../../core/resource/app_dimens.dart';
import '../../../../../core/resource/app_fonts.dart';
import '../../../../../core/resource/app_string.dart';
import '../../bloc/cubit/infomation_body_dart_cubit.dart';

class BodyFatWidget extends StatelessWidget {
  BodyFatWidget({super.key});

  final FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AppDimens.dimens_12,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppDimens.dimens_8),
                  child: IconButton(
                      onPressed: () {
                        context.read<InfomationBodyDartCubit>().changeIndex(2);
                        context
                            .read<InfomationBodyDartCubit>()
                            .changeImportBodyFat(false);
                      },
                      icon: const Icon(Icons.arrow_back_ios)),
                ),
                const SizedBox(
                  height: AppDimens.dimens_16,
                ),
                const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: AppDimens.dimens_16),
                  child: Center(
                    child: Text(
                      'Hình dáng thân hình của bạn hiện tại là gì ?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: AppDimens.dimens_24,
                          fontWeight: AppFont.semiBold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: AppDimens.dimens_24,
                ),
                BlocBuilder<InfomationBodyDartCubit, InfomationBodyDartState>(
                  builder: (context, state) {
                    final PageController controller = PageController(
                        initialPage: context.select(
                            (InfomationBodyDartCubit cubit) =>
                                cubit.state.bodyShape),
                        viewportFraction: 0.45);
                    return Column(
                      children: [
                        SizedBox(
                          height: AppDimens.dimens_200,
                          child: PageView.builder(
                            onPageChanged: (value) {
                              if (value == 5) {
                                context
                                    .read<InfomationBodyDartCubit>()
                                    .changeImportBodyFat(true);

                                focusNode.requestFocus();
                              }
                              FocusScope.of(context).unfocus();
                              if (state.isImportBodyFat) {
                                if (!state.previousImport) {
                                  context
                                      .read<InfomationBodyDartCubit>()
                                      .changeImportBodyFat(
                                          state.previousImport);
                                }
                              }
                              HapticFeedback.heavyImpact();
                              context
                                  .read<InfomationBodyDartCubit>()
                                  .setBodyShape(value);
                              context
                                  .read<InfomationBodyDartCubit>()
                                  .setBodyFat('');
                            },
                            itemCount: 6,
                            itemBuilder: (context, index) => BlocBuilder<
                                InfomationBodyDartCubit,
                                InfomationBodyDartState>(
                              builder: (context, state) {
                                return ImageFiltered(
                                  imageFilter: ImageFilter.blur(
                                      sigmaX: index == state.bodyShape ? 0 : 15,
                                      sigmaY:
                                          index == state.bodyShape ? 0 : 15),
                                  child: Image.asset(
                                    state.gender == AppString.male
                                        ? AppAssets.manBodyShape[index]
                                        : AppAssets.womanBodyShape[index],
                                    fit: BoxFit.fitHeight,
                                  ),
                                );
                              },
                            ),
                            controller: controller,
                          ),
                        ),
                        const SizedBox(
                          height: AppDimens.dimens_32,
                        ),
                        Center(
                          child: SmoothPageIndicator(
                            axisDirection: Axis.horizontal,
                            controller: controller,
                            count: 6,
                            effect: const WormEffect(
                                strokeWidth: AppDimens.dimens_0,
                                dotColor: AppColor.grey,
                                dotHeight: AppDimens.dimens_8,
                                dotWidth: AppDimens.dimens_15,
                                activeDotColor: AppColor.pink,
                                spacing: AppDimens.dimens_15,
                                paintStyle: PaintingStyle.fill),
                          ),
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(
                  height: AppDimens.dimens_8,
                ),
                BlocBuilder<InfomationBodyDartCubit, InfomationBodyDartState>(
                  builder: (context, state) {
                    return Container(
                      width: double.infinity,
                      margin: const EdgeInsets.all(AppDimens.dimens_24),
                      padding: const EdgeInsets.all(AppDimens.dimens_16),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColor.pink.withOpacity(0.5),
                          ),
                          borderRadius:
                              BorderRadius.circular(AppDimens.dimens_24)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Lượng mỡ cơ thể bạn ước tính(xấp xỉ)'),
                          const SizedBox(
                            height: AppDimens.dimens_4,
                          ),
                          Text(
                            state.gender == AppString.female
                                ? AppString.listShapeFemale[state.bodyShape]
                                : AppString.listShapeMale[state.bodyShape],
                            style: const TextStyle(
                                fontSize: AppDimens.dimens_18,
                                fontWeight: AppFont.semiBold,
                                color: AppColor.pink),
                          ),
                          const SizedBox(
                            height: AppDimens.dimens_4,
                          ),
                          Text(AppString.listShapeIntoduce[state.bodyShape])
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: AppDimens.dimens_8,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppDimens.dimens_16,
                  ),
                  child: Center(
                    child: Text(
                      'Bạn đã xác định được % mỡ cơ thể?',
                      style: TextStyle(
                          fontSize: AppDimens.dimens_18,
                          fontWeight: AppFont.semiBold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: AppDimens.dimens_24,
                ),
                BlocBuilder<InfomationBodyDartCubit, InfomationBodyDartState>(
                  builder: (context, state) {
                    return state.isImportBodyFat
                        ? Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppDimens.dimens_16),
                            child: Column(
                              children: [
                                CupertinoTextField(
                                  onChanged: (value) {
                                    context
                                        .read<InfomationBodyDartCubit>()
                                        .setBodyFat(value);
                                    context
                                        .read<InfomationBodyDartCubit>()
                                        .checkValid(value);
                                  },
                                  focusNode: focusNode,
                                  placeholder: 'body fat',
                                  cursorColor: AppColor.black.withOpacity(0.2),
                                  onTapOutside: (event) {
                                    FocusScope.of(context).unfocus();
                                  },
                                  keyboardType: TextInputType.phone,
                                  decoration: BoxDecoration(
                                      color: AppColor.grey1,
                                      borderRadius: BorderRadius.circular(
                                          AppDimens.dimens_8),
                                      border: Border.all(
                                          width: AppDimens.dimens_1,
                                          color:
                                              AppColor.black.withOpacity(0.2))),
                                ),
                                if (state.valid != '')
                                  Text(
                                    state.valid,
                                    style: const TextStyle(
                                        color: AppColor.red,
                                        fontSize: AppDimens.dimens_12),
                                  ),
                              ],
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppDimens.dimens_16),
                            child: Center(
                              child: GestureDetector(
                                onTap: () {
                                  context
                                      .read<InfomationBodyDartCubit>()
                                      .changeImportBodyFat(true);
                                  context
                                      .read<InfomationBodyDartCubit>()
                                      .changePreviousImport(true);
                                },
                                child: Container(
                                  height: AppDimens.dimens_45,
                                  width: sizeScreen.width * 0.6,
                                  alignment: Alignment.center,
                                  padding:
                                      const EdgeInsets.all(AppDimens.dimens_8),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: AppDimens.dimens_1,
                                          color:
                                              AppColor.pink.withOpacity(0.5)),
                                      borderRadius: BorderRadius.circular(
                                          AppDimens.dimens_16)),
                                  child: const FittedBox(
                                    child: Text(
                                      'Nhập lượng mỡ cơ thể',
                                      style: TextStyle(
                                          fontSize: AppDimens.dimens_18,
                                          fontWeight: AppFont.semiBold,
                                          color: AppColor.pink),
                                    ),
                                  ),
                                ),
                              ),
                            ));
                  },
                ),
                const SizedBox(
                  height: AppDimens.dimens_32,
                )
              ],
            )),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
            right: AppDimens.dimens_24,
            left: AppDimens.dimens_24,
            bottom: AppDimens.dimens_12),
        child: BlocBuilder<InfomationBodyDartCubit, InfomationBodyDartState>(
          builder: (context, state) {
            return GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
                if (state.bodyShape != 5) {
                  context
                      .read<InfomationBodyDartCubit>()
                      .changeImportBodyFat(false);
                  context
                      .read<InfomationBodyDartCubit>()
                      .changePreviousImport(false);
                }

                if (setBodyFat(state.bodyFat, state.gender, state.bodyShape,
                    context, state.valid)) {
                  context.read<InfomationBodyDartCubit>().changeIndex(4);
                }
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
            );
          },
        ),
      ),
    );
  }
}

bool setBodyFat(String bodyFat, String gender, int shape, BuildContext context,
    String textError) {
  bool result = false;
  if (bodyFat == '') {
    if (gender == AppString.male) {
      switch (shape) {
        case 0:
          context
              .read<InfomationBodyDartCubit>()
              .setBodyFat(AppString.bodyFat1);
          result = true;
        case 1:
          context
              .read<InfomationBodyDartCubit>()
              .setBodyFat(AppString.bodyFat2);
          result = true;
        case 2:
          context
              .read<InfomationBodyDartCubit>()
              .setBodyFat(AppString.bodyFat3);
          result = true;
        case 3:
          context
              .read<InfomationBodyDartCubit>()
              .setBodyFat(AppString.bodyFat4);
          result = true;
        case 4:
          context
              .read<InfomationBodyDartCubit>()
              .setBodyFat(AppString.bodyFat5);
          result = true;

        default:
          result = false;
      }
    } else {
      switch (shape) {
        case 0:
          context
              .read<InfomationBodyDartCubit>()
              .setBodyFat(AppString.bodyFat7);
        case 1:
          context
              .read<InfomationBodyDartCubit>()
              .setBodyFat(AppString.bodyFat8);
        case 2:
          context
              .read<InfomationBodyDartCubit>()
              .setBodyFat(AppString.bodyFat9);
        case 3:
          context
              .read<InfomationBodyDartCubit>()
              .setBodyFat(AppString.bodyFat10);
        case 4:
          context
              .read<InfomationBodyDartCubit>()
              .setBodyFat(AppString.bodyFat11);

        default:
          result = false;
      }
    }
  } else {
    if (textError == '') {
      result = true;
    } else {
      result = false;
    }
  }
  return result;
}
