import 'package:fitness_nutrition/src/presentation/view/main/widget/home_widget/home_top_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../../core/funtions/day_of_week.dart';
import '../../../../core/resource/app_dimens.dart';
import '../widget/home_widget/time_exercise_widget.dart';
import '../widget/home_widget/today_infomation_widget.dart';
import '../widget/home_widget/today_plan_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final List<DateTime> listDateTime = getWeek(DateTime.now());
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(AppDimens.dimens_0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeTopWidget('Liệu', listDateTime),
            const SizedBox(
              height: AppDimens.dimens_36,
            ),
            TodayInfomation(screenSize, listDateTime),
            const SizedBox(
              height: AppDimens.dimens_16,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: AppDimens.dimens_24),
              child: TodayPlan(listDateTime),
            ),
            const SizedBox(
              height: AppDimens.dimens_16,
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: AppDimens.dimens_24),
              child: TimeExerciseWidget(),
            ),
            const SizedBox(
              height: AppDimens.dimens_105,
            )
          ],
        ),
      ),
    );
  }
}
