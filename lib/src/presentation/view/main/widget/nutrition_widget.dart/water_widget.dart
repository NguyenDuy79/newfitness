import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../../core/funtions/get_meal_of_day.dart';
import '../../../../../core/resource/app_colors.dart';
import '../../../../../core/resource/app_dimens.dart';
import '../../../../../core/resource/app_fonts.dart';
import '../../../../../core/resource/app_string.dart';

import '../../../../../domain/entities/water.dart';
import '../../../../bloc/water_cubit/water_cubit.dart';
import '../../../first/first_cubit.dart';
import '../../cubit/nutrition_screen/nutrition_screen_cubit_cubit.dart';
import 'add_water_button.dart';

class WaterWidget extends StatefulWidget {
  const WaterWidget(
      {super.key,
      required this.sizeScreen,
      required this.water,
      required this.index,
      required this.checkToday,
      required this.listDateTime});
  final Size sizeScreen;
  final int water;
  final int index;
  final bool checkToday;
  final List<DateTime> listDateTime;
  @override
  State<WaterWidget> createState() => _WaterWidgetState();
}

class _WaterWidgetState extends State<WaterWidget> {
  final PageController controller = PageController(initialPage: 0);
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WaterCubit, WaterState>(
      listener: (context, state) {
        if (state.status == FormzSubmissionStatus.failure) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: AppColor.black.withOpacity(0.6),
              content: const Text('Có lỗi gì đó, hãy thử lại')));
        }
      },
      builder: (context, state) {
        final Water? water =
            getWaterToday(state.allWater, widget.index, widget.listDateTime);
        final List<int> waterData = listData(water);
        final double waterDrinkedToday = waterIntakeToday(water, waterData);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: AppDimens.dimens_250,
              width: double.infinity,
              padding:
                  const EdgeInsets.symmetric(horizontal: AppDimens.dimens_16),
              child: Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: AppDimens.dimens_250,
                        width: (widget.sizeScreen.width -
                                AppDimens.dimens_32 -
                                AppDimens.dimens_16) *
                            1 /
                            2.5,
                        decoration: BoxDecoration(
                            color: AppColor.blue.withOpacity(0.15),
                            borderRadius:
                                BorderRadius.circular(AppDimens.dimens_24)),
                      ),
                      Positioned(
                          bottom: AppDimens.dimens_0,
                          child: Container(
                            height:
                                waterDrinkedToday / 2 * AppDimens.dimens_250,
                            width: (widget.sizeScreen.width -
                                    AppDimens.dimens_32 -
                                    AppDimens.dimens_16) *
                                1 /
                                2.5,
                            decoration: const BoxDecoration(
                                color: AppColor.blue,
                                borderRadius: BorderRadius.only(
                                    bottomLeft:
                                        Radius.circular(AppDimens.dimens_24),
                                    bottomRight:
                                        Radius.circular(AppDimens.dimens_24))),
                          )),
                      Positioned(
                        bottom: AppDimens.dimens_5,
                        child: Container(
                          height: AppDimens.dimens_25,
                          width: (widget.sizeScreen.width -
                                  AppDimens.dimens_32 -
                                  AppDimens.dimens_16) *
                              1 /
                              2.5,
                          alignment: Alignment.center,
                          child: Text(
                            '${waterDrinkedToday == 0 ? '0' : (waterDrinkedToday / 2 * 100)}%',
                            style: const TextStyle(
                                fontSize: AppDimens.dimens_20,
                                fontWeight: AppFont.semiBold,
                                color: AppColor.white),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: AppDimens.dimens_16,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: widget.checkToday ? 'Hiện tại:' : 'Đã uống:',
                            style: const TextStyle(
                                fontSize: AppDimens.dimens_18,
                                color: AppColor.black)),
                        TextSpan(
                            text: '$waterDrinkedToday/2 ',
                            style: const TextStyle(
                                fontSize: AppDimens.dimens_18,
                                fontWeight: AppFont.bold,
                                color: AppColor.black)),
                        const TextSpan(
                            text: 'lít',
                            style: TextStyle(
                                fontSize: AppDimens.dimens_18,
                                color: AppColor.black))
                      ])),
                      if (widget.checkToday)
                        const SizedBox(
                          height: AppDimens.dimens_8,
                        ),
                      if (widget.checkToday)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                context
                                    .read<NutritionScreenCubit>()
                                    .reduceWater();
                              },
                              child: Container(
                                height: AppDimens.dimens_30,
                                width: AppDimens.dimens_30,
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                    color: AppColor.blue,
                                    shape: BoxShape.circle),
                                child: const Icon(
                                  Icons.remove,
                                  color: AppColor.white,
                                  size: AppDimens.dimens_30,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: AppDimens.dimens_5,
                            ),
                            Container(
                              width: AppDimens.dimens_75,
                              height: AppDimens.dimens_30,
                              alignment: Alignment.center,
                              child: Text(
                                '${widget.water}ml',
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: AppDimens.dimens_16,
                                    fontWeight: AppFont.medium),
                              ),
                            ),
                            const SizedBox(
                              height: AppDimens.dimens_5,
                            ),
                            GestureDetector(
                              onTap: () {
                                context
                                    .read<NutritionScreenCubit>()
                                    .addMoreWater();
                              },
                              child: Container(
                                height: AppDimens.dimens_30,
                                width: AppDimens.dimens_30,
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                    color: AppColor.blue,
                                    shape: BoxShape.circle),
                                child: const Icon(
                                  Icons.add,
                                  color: AppColor.white,
                                  size: AppDimens.dimens_30,
                                ),
                              ),
                            )
                          ],
                        ),
                      if (widget.checkToday)
                        const SizedBox(
                          height: AppDimens.dimens_8,
                        ),
                      if (widget.checkToday)
                        GestureDetector(
                          onTap: () async {
                            Water newWater = Water(
                                key: water == null ? 0 : water.key,
                                dateTime: DateFormat('yyyy-MM-dd')
                                    .format(DateTime.now()),
                                valueEachHour: water == null
                                    ? {
                                        getHourToString(DateTime.now().hour):
                                            widget.water,
                                        for (int i = 0; i < 24; i++)
                                          if (getHourToString(
                                                  DateTime.now().hour) !=
                                              AppString.listHour[i])
                                            AppString.listHour[i]: 0,
                                      }
                                    : {
                                        getHourToString(DateTime.now().hour):
                                            water.valueEachHour[getHourToString(
                                                    DateTime.now().hour)]! +
                                                widget.water,
                                        for (int i = 0; i < 24; i++)
                                          if (getHourToString(
                                                  DateTime.now().hour) !=
                                              AppString.listHour[i])
                                            AppString.listHour[i]:
                                                water.valueEachHour[
                                                    AppString.listHour[i]]!,
                                      });
                            water == null
                                ? await context
                                    .read<WaterCubit>()
                                    .insertWater(newWater.toMap())
                                : await context
                                    .read<WaterCubit>()
                                    .updateWater(newWater);
                          },
                          child: Container(
                            width: AppDimens.dimens_70,
                            height: AppDimens.dimens_30,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: AppColor.blue,
                                borderRadius:
                                    BorderRadius.circular(AppDimens.dimens_8)),
                            child: const Text(
                              'Thêm',
                              style: TextStyle(
                                  fontSize: AppDimens.dimens_18,
                                  fontWeight: AppFont.semiBold,
                                  color: AppColor.white),
                            ),
                          ),
                        ),
                      if (widget.checkToday)
                        const Text(
                          'Or',
                          style: TextStyle(
                              fontSize: AppDimens.dimens_16,
                              fontWeight: AppFont.bold),
                        ),
                      if (widget.checkToday)
                        BlocProvider(
                          create: (context) => FirstCubit(),
                          child: GestureDetector(
                            onTap: () {
                              Water newWater = Water(
                                  key: water == null ? 0 : water.key,
                                  dateTime: DateFormat('yyyy-MM-dd')
                                      .format(DateTime.now()),
                                  valueEachHour: water == null
                                      ? {
                                          getHourToString(DateTime.now().hour):
                                              250,
                                          for (int i = 0; i < 24; i++)
                                            if (getHourToString(
                                                    DateTime.now().hour) !=
                                                AppString.listHour[i])
                                              AppString.listHour[i]: 0,
                                        }
                                      : {
                                          getHourToString(DateTime.now().hour):
                                              water.valueEachHour[
                                                      getHourToString(
                                                          DateTime.now()
                                                              .hour)]! +
                                                  250,
                                          for (int i = 0; i < 24; i++)
                                            if (getHourToString(
                                                    DateTime.now().hour) !=
                                                AppString.listHour[i])
                                              AppString.listHour[i]:
                                                  water.valueEachHour[
                                                      AppString.listHour[i]]!,
                                        });
                              water == null
                                  ? context
                                      .read<WaterCubit>()
                                      .insertWater(newWater.toMap())
                                  : context
                                      .read<WaterCubit>()
                                      .updateWater(newWater);
                            },
                            child: Container(
                                width: AppDimens.dimens_70,
                                height: AppDimens.dimens_30,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: AppColor.blue,
                                    borderRadius: BorderRadius.circular(
                                        AppDimens.dimens_8)),
                                child: BlocBuilder<FirstCubit, int>(
                                  builder: (context, state) {
                                    return ButtonWaterWidget(
                                        index: state, controller: controller);
                                  },
                                )),
                          ),
                        )
                    ],
                  ))
                ],
              ),
            ),
            const SizedBox(
              height: AppDimens.dimens_16,
            ),
            const Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppDimens.dimens_16,
                    vertical: AppDimens.dimens_10),
                child: Text(
                  'Biểu đồ nước uống hôm nay',
                  style: TextStyle(
                      fontSize: AppDimens.dimens_18,
                      fontWeight: AppFont.semiBold),
                )),
            Container(
                height: AppDimens.dimens_200,
                width: double.infinity,
                margin:
                    const EdgeInsets.symmetric(horizontal: AppDimens.dimens_15),
                padding:
                    const EdgeInsets.symmetric(vertical: AppDimens.dimens_8),
                decoration: const BoxDecoration(
                  color: AppColor.grey1,
                ),
                child: SfCartesianChart(
                  primaryXAxis: CategoryAxis(
                      autoScrollingDelta: 24,
                      interval: 2,
                      majorGridLines: const MajorGridLines(width: 0)),
                  primaryYAxis: NumericAxis(minimum: 0, interval: 100),
                  series: <ChartSeries<Map<int, int>, String>>[
                    ColumnSeries(
                        dataSource: mapChart(waterData),
                        xValueMapper: (data, index) =>
                            data.keys.first.toString(),
                        yValueMapper: (data, index) => data.values.first,
                        color: AppColor.blue)
                  ],
                ))
          ],
        );
      },
    );
  }
}

Water? getWaterToday(
    List<Water> water, int choose, List<DateTime> listDateTime) {
  for (int i = 0; i < water.length; i++) {
    if (checkMeal(water[i].dateTime, listDateTime[choose]) == 0) {
      return water[i];
    }
  }
  return null;
}

List<int> listData(Water? waterToday) {
  if (waterToday == null) {
    return [for (int i = 0; i < 24; i++) 0];
  } else {
    return [
      waterToday.valueEachHour[AppString.one] ?? 0,
      waterToday.valueEachHour[AppString.two] ?? 0,
      waterToday.valueEachHour[AppString.three] ?? 0,
      waterToday.valueEachHour[AppString.four] ?? 0,
      waterToday.valueEachHour[AppString.five] ?? 0,
      waterToday.valueEachHour[AppString.six] ?? 0,
      waterToday.valueEachHour[AppString.seven] ?? 0,
      waterToday.valueEachHour[AppString.eight] ?? 0,
      waterToday.valueEachHour[AppString.nine] ?? 0,
      waterToday.valueEachHour[AppString.ten] ?? 0,
      waterToday.valueEachHour[AppString.eleven] ?? 0,
      waterToday.valueEachHour[AppString.twelve] ?? 0,
      waterToday.valueEachHour[AppString.thirteen] ?? 0,
      waterToday.valueEachHour[AppString.fourteen] ?? 0,
      waterToday.valueEachHour[AppString.fifteen] ?? 0,
      waterToday.valueEachHour[AppString.sixteen] ?? 0,
      waterToday.valueEachHour[AppString.seventeen] ?? 0,
      waterToday.valueEachHour[AppString.eighteen] ?? 0,
      waterToday.valueEachHour[AppString.nineteen] ?? 0,
      waterToday.valueEachHour[AppString.twenty] ?? 0,
      waterToday.valueEachHour[AppString.twentyone] ?? 0,
      waterToday.valueEachHour[AppString.twentytwo] ?? 0,
      waterToday.valueEachHour[AppString.twentythree] ?? 0,
    ];
  }
}

List<Map<int, int>> mapChart(List<int> waterData) {
  List<Map<int, int>> result = [];
  for (int i = 0; i < waterData.length; i++) {
    result.add({i + 1: waterData[i]});
  }

  return result;
}

double waterIntakeToday(Water? waterToday, List<int> listWaterDrink) {
  int result = 0;
  if (waterToday == null) {
    return 0;
  } else {
    for (int i = 0; i < listWaterDrink.length; i++) {
      result = result + listWaterDrink[i];
    }
    return result / 1000;
  }
}

String getHourToString(int hour) {
  switch (hour) {
    case 0:
      return AppString.zero;
    case 1:
      return AppString.one;
    case 2:
      return AppString.two;
    case 3:
      return AppString.three;
    case 4:
      return AppString.four;
    case 5:
      return AppString.five;
    case 6:
      return AppString.six;
    case 7:
      return AppString.seven;
    case 8:
      return AppString.eight;
    case 9:
      return AppString.nine;
    case 10:
      return AppString.ten;
    case 11:
      return AppString.eleven;
    case 12:
      return AppString.twelve;
    case 13:
      return AppString.thirteen;
    case 14:
      return AppString.fourteen;
    case 15:
      return AppString.fifteen;
    case 16:
      return AppString.sixteen;
    case 17:
      return AppString.seventeen;
    case 18:
      return AppString.eighteen;
    case 19:
      return AppString.nineteen;
    case 20:
      return AppString.twenty;
    case 21:
      return AppString.twentyone;
    case 22:
      return AppString.twentytwo;
    default:
      return AppString.twentythree;
  }
}
