import 'package:fitness_nutrition/src/presentation/view/first/first_cubit.dart';
import 'package:fitness_nutrition/src/presentation/view/first/first_widget.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/route/route_generator_route.dart';
import '../../../core/resource/app_colors.dart';
import '../../../core/resource/app_dimens.dart';
import '../../../core/resource/app_fonts.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final PageController controller = PageController(initialPage: 0);
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size sizeScreen = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
          body: Stack(
        children: [
          Container(
              height: sizeScreen.height,
              alignment: Alignment.center,
              width: sizeScreen.width,
              child: BlocBuilder<FirstCubit, int>(
                builder: (context, state) {
                  return FirstWidget(controller, state);
                },
              )),
          Positioned(
            bottom: AppDimens.dimens_0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(RouteGenerator.setupScreen);
                  },
                  child: Container(
                    height: AppDimens.dimens_45,
                    width: AppDimens.dimens_200,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: AppColor.pink,
                        borderRadius:
                            BorderRadius.circular(AppDimens.dimens_16)),
                    child: const Text(
                      'Bắt đầu',
                      style: TextStyle(
                          fontSize: AppDimens.dimens_32,
                          color: AppColor.white,
                          fontWeight: AppFont.semiBold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: AppDimens.dimens_16,
                ),
                Container(
                  width: sizeScreen.width,
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppDimens.dimens_16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          flex: 1,
                          child: Container(
                            height: AppDimens.dimens_1,
                            color: AppColor.black,
                          )),
                      const SizedBox(
                        width: AppDimens.dimens_16,
                      ),
                      const Text(
                        'Đã là người dùng của chúng tôi?',
                        style: TextStyle(
                            color: AppColor.black,
                            fontSize: AppDimens.dimens_12),
                      ),
                      const SizedBox(
                        width: AppDimens.dimens_16,
                      ),
                      Expanded(
                          flex: 1,
                          child: Container(
                            height: AppDimens.dimens_1,
                            color: AppColor.black,
                          )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: AppDimens.dimens_16,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Tiếp tục với tài khoản của bạn? >',
                    style: TextStyle(
                        fontWeight: AppFont.medium,
                        color: AppColor.pink.withOpacity(0.7)),
                  ),
                ),
                const SizedBox(
                  height: AppDimens.dimens_50,
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
