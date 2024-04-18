import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/resource/app_colors.dart';
import '../../../../../core/resource/app_dimens.dart';
import '../../../../../core/resource/app_fonts.dart';
import '../../../first/first_cubit.dart';

class ButtonWaterWidget extends StatefulWidget {
  const ButtonWaterWidget(
      {super.key, required this.index, required this.controller});
  final int index;
  final PageController controller;
  @override
  State<ButtonWaterWidget> createState() => _ButtonWaterWidgetState();
}

class _ButtonWaterWidgetState extends State<ButtonWaterWidget> {
  Timer? timer;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (widget.index < 1) {
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
      children: const [
        Center(
          child: Text(
            '+ 1 cốc',
            style: TextStyle(
                fontSize: AppDimens.dimens_16,
                fontWeight: AppFont.semiBold,
                color: AppColor.white),
          ),
        ),
        Center(
          child: Text(
            '+250ml',
            style: TextStyle(
                fontSize: AppDimens.dimens_16,
                fontWeight: AppFont.semiBold,
                color: AppColor.white),
          ),
        )
      ],
    );
  }
}
