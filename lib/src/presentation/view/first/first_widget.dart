import 'dart:async';


import 'package:fitness_nutrition/src/presentation/view/first/first_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/resource/app_colors.dart';
import '../../../core/resource/app_dimens.dart';
import '../../../core/resource/app_fonts.dart';

class FirstWidget extends StatefulWidget {
  const FirstWidget(this.controller, this.index, {super.key});
  final PageController controller;
  final int index;
  @override
  State<FirstWidget> createState() => _FirstWidgetState();
}

class _FirstWidgetState extends State<FirstWidget> {
  Timer? timer;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (widget.index < 2) {
        context.read<FirstCubit>().newValue();
      } else {
        context.read<FirstCubit>().resetValue();
      }
      widget.controller.animateToPage(widget.index,
          duration: const Duration(microseconds: 1), curve: Curves.linear);
    });
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: widget.controller,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Chào mừng đến với',
                style: TextStyle(
                    fontSize: AppDimens.dimens_24,
                    fontWeight: AppFont.medium,
                    color: AppColor.black)),
            FittedBox(
              child: Text('Fitness and Nutrition',
                  style: TextStyle(
                      fontSize: AppDimens.dimens_32,
                      fontStyle: AppFont.italic,
                      fontWeight: AppFont.semiBold,
                      color: AppColor.black)),
            )
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
                text: const TextSpan(children: [
              TextSpan(
                  text: 'Với ',
                  style: TextStyle(
                      color: AppColor.black, fontSize: AppDimens.dimens_20)),
              TextSpan(
                  text: 'luyện tập ',
                  style: TextStyle(
                      color: AppColor.black,
                      fontSize: AppDimens.dimens_26,
                      fontStyle: AppFont.italic,
                      fontWeight: AppFont.bold)),
              TextSpan(
                  text: 'và ',
                  style: TextStyle(
                      color: AppColor.black, fontSize: AppDimens.dimens_20)),
              TextSpan(
                  text: 'dinh dưỡng',
                  style: TextStyle(
                      color: AppColor.black,
                      fontSize: AppDimens.dimens_26,
                      fontWeight: AppFont.bold,
                      fontStyle: AppFont.italic)),
            ])),
            const SizedBox(
              height: AppDimens.dimens_5,
            ),
            const Text('Chúng tôi sẽ hỗ trợ bạn đạt đến mục tiêu của mình',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColor.black,
                  fontSize: AppDimens.dimens_20,
                ))
          ],
        ),
        const Center(
          child: Text(
            'Hãy bắt đầu thôi nào !',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: AppDimens.dimens_30,
                fontWeight: AppFont.medium,
                fontStyle: AppFont.italic),
          ),
        )
      ],
    );
  }
}
