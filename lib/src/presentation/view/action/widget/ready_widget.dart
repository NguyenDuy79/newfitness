import 'package:fitness_nutrition/src/core/resource/app_colors.dart';
import 'package:fitness_nutrition/src/core/resource/app_dimens.dart';
import 'package:fitness_nutrition/src/core/resource/app_fonts.dart';

import 'package:fitness_nutrition/src/presentation/view/action/cubit/action_cubit/action_cubit.dart';
import 'package:fitness_nutrition/src/presentation/view/action/cubit/timer_bloc/timer_cubit.dart';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReadyWidget extends StatelessWidget {
  const ReadyWidget(this.map, {super.key});
  final Map<String, Map<String, String>> map;

  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Bài tập đầu tiên: ${map.values.first.values.toList()[0]} ',
              style: const TextStyle(
                  fontSize: AppDimens.dimens_20,
                  color: AppColor.black,
                  fontWeight: AppFont.semiBold)),
          const SizedBox(
            height: AppDimens.dimens_24,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.pink,
                elevation: AppDimens.dimens_5,
                padding: const EdgeInsets.all(AppDimens.dimens_0)),
            onPressed: () {
              showAlertDialog(context);
            },
            child: Container(
              height: sizeScreen.width * 0.4,
              width: sizeScreen.width * 0.4,
              alignment: Alignment.center,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: const Text(
                'Bắt đầu',
                style: TextStyle(
                    fontSize: AppDimens.dimens_24,
                    color: AppColor.white,
                    fontWeight: AppFont.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void showAlertDialog(BuildContext context) {
  bool confirm = false;
  showCupertinoModalPopup(
    context: context,
    builder: (BuildContext context) => CupertinoAlertDialog(
      title: const Text('Xác nhận'),
      content: const Text('Hãy bấm xác nhận khi bạn sẵn sàng'),
      actions: <CupertinoDialogAction>[
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Không'),
        ),
        CupertinoDialogAction(
          isDestructiveAction: true,
          onPressed: () {
            Navigator.pop(context);
            confirm = true;
          },
          child: const Text('Xác nhận'),
        ),
      ],
    ),
  ).then((value) {
    if (confirm) {
      context.read<ActionCubit>().changePage(1);
      context.read<TimerCubit>().startedRestTime(10);
    }
  });
}
