import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../../core/resource/app_colors.dart';
import '../../../../../core/resource/app_dimens.dart';
import '../../../../../core/resource/app_fonts.dart';

class TimeExerciseWidget extends StatelessWidget {
  TimeExerciseWidget({super.key});

  final Color barBackgroundColor = AppColor.pink.withOpacity(0.3);
  final Color barColor = AppColor.pink;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        SizedBox(
          height: AppDimens.dimens_28,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Thời gian tập luyện',
                style: TextStyle(
                    fontSize: AppDimens.dimens_18,
                    fontWeight: AppFont.semiBold),
              ),
              GestureDetector(
                child: const Icon(
                  Icons.more_horiz_outlined,
                  size: AppDimens.dimens_24,
                  color: AppColor.pink,
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: AppDimens.dimens_24,
        ),
        Container(
          padding: const EdgeInsetsDirectional.only(top: AppDimens.dimens_10),
          height: AppDimens.dimens_300,
          child: BarChart(
            randomData(),
          ),
        ),
      ],
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y,
  ) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: x >= 4 ? Colors.transparent : barColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(AppDimens.dimens_4),
              topRight: Radius.circular(AppDimens.dimens_4)),
          //   borderDashArray: x >= 4 ? [4, 4] : null,
          width: 22,
          borderSide: BorderSide(color: barColor, width: 2.0),
        ),
      ],
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: AppColor.black,
      fontWeight: FontWeight.bold,
      fontSize: 12,
    );
    List<String> days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

    Widget text = Text(
      days[value.toInt()],
      style: style,
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: text,
    );
  }

  Widget getValue(double value, TitleMeta meta) {
    Widget text = Text(
      '${value.toInt()}',
      style: const TextStyle(fontSize: AppDimens.dimens_14),
    );
    return SideTitleWidget(axisSide: meta.axisSide, child: text);
  }

  BarChartData randomData() {
    return BarChartData(
      maxY: 200.0,
      barTouchData: BarTouchData(
        enabled: true,
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 38,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
              reservedSize: 40, showTitles: true, getTitlesWidget: getValue),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: List.generate(
        7,
        (i) => makeGroupData(i, ramdom[i]),
      ),
      gridData: FlGridData(show: false),
    );
  }
}

List<double> ramdom = [200, 20, 120, 150, 120, 130, 140];
