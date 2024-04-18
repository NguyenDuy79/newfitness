import 'package:fitness_nutrition/src/core/resource/app_dimens.dart';
import 'package:fitness_nutrition/src/domain/entities/activity.dart';
import 'package:fitness_nutrition/src/presentation/view/action/cubit/action_cubit/action_cubit.dart';
import 'package:fitness_nutrition/src/presentation/view/action/cubit/timer_bloc/timer_cubit.dart';
import 'package:fitness_nutrition/src/presentation/view/action/widget/history_widget.dart';
import 'package:fitness_nutrition/src/presentation/view/action/widget/in_time_widget.dart';
import 'package:fitness_nutrition/src/presentation/view/action/widget/ready_widget.dart';
import 'package:fitness_nutrition/src/presentation/view/action/widget/rest_widget.dart';
import 'package:fitness_nutrition/src/presentation/widget/global/back_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';

class ActionScreen extends StatefulWidget {
  const ActionScreen(this.activity, {super.key});
  final Activity activity;

  @override
  State<ActionScreen> createState() => _ActionScreenState();
}

class _ActionScreenState extends State<ActionScreen> {
  FlutterTts flutterTts = FlutterTts();
  void initSetting() async {
    await flutterTts.setLanguage("vi-Vn");
  }

  @override
  void initState() {
    initSetting();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ActionCubit, ActionState>(
        buildWhen: (previous, current) =>
            previous.indexPage != current.indexPage,
        builder: (context, state) {
          return WillPopScope(
            onWillPop: () async {
              if (state.indexPage > 0) {
                return false;
              } else {
                context.read<TimerCubit>().close();
                return true;
              }
            },
            child: SafeArea(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppDimens.dimens_18),
                  child: BackButtonWidget(() {
                    if (state.indexPage > 0) {
                    } else {
                      context.read<TimerCubit>().close();
                      Navigator.of(context).pop();
                    }
                  }),
                ),
                Expanded(
                  child:
                      listWidget(widget.activity, flutterTts)[state.indexPage],
                )
              ],
            )),
          );
        },
      ),
    );
  }
}

List<Widget> listWidget(Activity activity, FlutterTts flutterTts) {
  return [
    ReadyWidget(
      activity.exercise,
    ),
    RestWidget(activity, flutterTts),
    InTimeWidget(),
    HistoryWidget()
  ];
}

String formatTime(int duration) {
  Duration value = Duration(seconds: duration);

  final hours = value.inHours.remainder(24).toString().padLeft(2, '0');

  final minutes = value.inMinutes.remainder(60).toString().padLeft(2, '0');
  final seconds = value.inSeconds.remainder(60).toString().padLeft(2, '0');

  if (value.inHours > 0) {
    return '$hours:$minutes:$seconds';
  } else {
    return '$minutes:$seconds';
  }
}
