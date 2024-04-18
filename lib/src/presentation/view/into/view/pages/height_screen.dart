import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/resource/app_colors.dart';
import '../../../../../core/resource/app_dimens.dart';
import '../../../../../core/resource/app_fonts.dart';
import '../../bloc/cubit/infomation_body_dart_cubit.dart';

// ignore: must_be_immutable
class ChooseHeightWidget extends StatelessWidget {
  const ChooseHeightWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: AppDimens.dimens_12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppDimens.dimens_8, vertical: AppDimens.dimens_8),
              child: GestureDetector(
                  onTap: () {
                    context.read<InfomationBodyDartCubit>().changeIndex(4);
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
                  'Chiều cao của bạn là bao nhiêu ?',
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
                FixedExtentScrollController scrollController1 =
                    FixedExtentScrollController(
                        initialItem: state.cm
                            ? state.startChooseHeightCm
                            : state.startChooseHeightFt);
                return Expanded(
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                            height: AppDimens.dimens_45,
                            width: AppDimens.dimens_150,
                            decoration: BoxDecoration(
                                color: AppColor.grey,
                                borderRadius:
                                    BorderRadius.circular(AppDimens.dimens_24)),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    scrollController1
                                        .jumpToItem(state.startChooseHeightCm);
                                    context
                                        .read<InfomationBodyDartCubit>()
                                        .setHeight(
                                            state.startChooseHeightCm + 100);

                                    context
                                        .read<InfomationBodyDartCubit>()
                                        .changeCm(true);
                                  },
                                  child: Container(
                                    height: AppDimens.dimens_45,
                                    width: AppDimens.dimens_75,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: state.cm
                                            ? AppColor.pink
                                            : AppColor.grey,
                                        borderRadius: BorderRadius.circular(
                                            AppDimens.dimens_24)),
                                    child: Text(
                                      'cm',
                                      style: TextStyle(
                                          fontSize: AppDimens.dimens_24,
                                          color: state.cm
                                              ? AppColor.white
                                              : AppColor.black,
                                          fontWeight: AppFont.semiBold),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    scrollController1
                                        .jumpToItem(state.startChooseHeightFt);
                                    context
                                        .read<InfomationBodyDartCubit>()
                                        .setHeight(
                                            (state.startChooseHeightFt * 2.54)
                                                    .round() +
                                                99);

                                    context
                                        .read<InfomationBodyDartCubit>()
                                        .changeCm(false);
                                  },
                                  child: Container(
                                    height: AppDimens.dimens_45,
                                    width: AppDimens.dimens_75,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: state.cm
                                            ? AppColor.grey
                                            : AppColor.pink,
                                        borderRadius: BorderRadius.circular(
                                            AppDimens.dimens_24)),
                                    child: Text(
                                      'ft',
                                      style: TextStyle(
                                          fontSize: AppDimens.dimens_24,
                                          color: state.cm
                                              ? AppColor.black
                                              : AppColor.white,
                                          fontWeight: AppFont.semiBold),
                                    ),
                                  ),
                                )
                              ],
                            )),
                      ),
                      const SizedBox(
                        height: AppDimens.dimens_16,
                      ),
                      Expanded(child: BlocBuilder<InfomationBodyDartCubit,
                          InfomationBodyDartState>(
                        builder: (context, state) {
                          return CupertinoPicker(
                              magnification: 1,
                              useMagnifier: true,
                              scrollController: scrollController1,
                              itemExtent: AppDimens.dimens_40,
                              offAxisFraction: 0,
                              onSelectedItemChanged: (value) {
                                state.cm
                                    ? context
                                        .read<InfomationBodyDartCubit>()
                                        .setHeight(value + 100)
                                    : context
                                        .read<InfomationBodyDartCubit>()
                                        .setHeight((value * 2.54).round() + 99);
                              },
                              children:
                                  state.cm ? listHeightCm() : listHeightFt());
                        },
                      )),
                    ],
                  ),
                );
              },
            ),

            // Container(
            //     //color: AppColor.darkPink,
            //     height:
            //         sizeScreen.height - AppDimens.dimens_300 - statusBarSize,
            //     padding:
            //         const EdgeInsets.symmetric(vertical: AppDimens.dimens_8),
            //     child: Stack(
            //       children: [
            //         Align(
            //           alignment: const Alignment(1, 0),
            //           child: Container(
            //               width: AppDimens.dimens_40,
            //               margin:
            //                   const EdgeInsets.only(right: AppDimens.dimens_20),
            //               child: NotificationListener<ScrollNotification>(
            //                 onNotification: (notification) {
            //                   if (position % (maxExtent / 199) == 0) {
            //                     HapticFeedback.mediumImpact();
            //                   }
            //                   return true;
            //                 },
            //                 child: ListView.builder(
            //                     itemCount: 200,
            //                     controller: _scrollController,
            //                     //    physics: MyScrollPhysics(),
            //                     physics: const ClampingScrollPhysics(),
            //                     itemBuilder: (context, index) {
            //                       return Row(
            //                         mainAxisAlignment: MainAxisAlignment.end,
            //                         children: [
            //                           Container(),
            //                           Container(
            //                             height: AppDimens.dimens_1,
            //                             width: index == 0 ||
            //                                     index.toString().endsWith('9')
            //                                 ? AppDimens.dimens_40
            //                                 : AppDimens.dimens_20,
            //                             margin: EdgeInsets.only(
            //                                 top: index == 0
            //                                     ? AppDimens.dimens_0
            //                                     : AppDimens.dimens_3,
            //                                 bottom: index == 199
            //                                     ? AppDimens.dimens_0
            //                                     : AppDimens.dimens_3),
            //                             decoration: const BoxDecoration(
            //                               color: AppColor.black,
            //                             ),
            //                           ),
            //                         ],
            //                       );
            //                     }),
            //               )),
            //         ),
            //         Positioned(
            //           left: sizeScreen.width * 0.5,
            //           right: AppDimens.dimens_20,
            //           top: position *
            //               (sizeScreen.height -
            //                   AppDimens.dimens_300 -
            //                   statusBarSize -
            //                   AppDimens.dimens_17) /
            //               maxExtent,
            //           child: Container(
            //             height: AppDimens.dimens_1,
            //             width: sizeScreen.width * 0.5,
            //             color: AppColor.green,
            //           ),
            //         )
            //         // RulerPicker(onValueChanged: onValueChanged, width: width, height: height, onBuildRulerScaleText: onBuildRulerScaleText)
            //       ],
            //     )),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
            right: AppDimens.dimens_24,
            left: AppDimens.dimens_24,
            bottom: AppDimens.dimens_12),
        child: GestureDetector(
          onTap: () {
            context.read<InfomationBodyDartCubit>().changeIndex(6);
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
        ),
      ),
    );
  }
}

List<Widget> listHeightCm() {
  List<Widget> listWidget = [];
  for (int i = 0; i <= 150; i++) {
    listWidget.add(Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.dimens_8),
      child: Text(
        '${i + 100} cm',
        style: const TextStyle(
            fontSize: AppDimens.dimens_24,
            fontWeight: AppFont.semiBold,
            color: AppColor.pink),
      ),
    ));
  }
  return listWidget;
}

List<Widget> listHeightFt() {
  List<Widget> listWidget = [];
  int ft = 3;
  int inch = 3;
  for (int i = 0; i <= 59; i++) {
    if (checkFt(i)) {
      ft++;
      inch = 1;
      listWidget.add(Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppDimens.dimens_8),
        child: Text(
          '${ft}ft',
          style: const TextStyle(
              fontSize: AppDimens.dimens_24,
              fontWeight: AppFont.semiBold,
              color: AppColor.pink),
        ),
      ));
    } else {
      listWidget.add(Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppDimens.dimens_8),
        child: Text(
          '${ft}ft$inch',
          style: const TextStyle(
              fontSize: AppDimens.dimens_24,
              fontWeight: AppFont.semiBold,
              color: AppColor.pink),
        ),
      ));
      inch++;
    }
  }
  return listWidget;
}

bool checkFt(int i) {
  bool value = false;
  if (i == 9) {
    value = true;
  } else {
    for (int j = 1; j <= ((59 - 9)) ~/ 12; j++) {
      if ((i - 12 * j) < 9) {
        value = false;
      } else {
        if (i - 12 * j == 9) {
          value = true;
          break;
        } else {
          value = false;
        }
      }
    }
  }

  return value;
}
