import 'package:fitness_nutrition/src/core/funtions/get_list_method.dart';
import 'package:fitness_nutrition/src/core/resource/app_string.dart';
import 'package:fitness_nutrition/src/presentation/bloc/schedule_cubit/schedule_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../core/resource/app_colors.dart';
import '../../../../../core/resource/app_dimens.dart';
import '../../../../../core/resource/app_fonts.dart';

class TodayPlan extends StatelessWidget {
  const TodayPlan(this.listDateTime, {super.key});
  final List<DateTime> listDateTime;
  static const List<String> image = [
    'assets/images/dumbbell.png',
    'assets/images/calisthenics.png',
    'assets/images/cardio.png'
  ];
  static const List<String> name = [
    'Gym',
    'Calis',
    'Cardio',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Kế hoạch ngày hôm nay',
          style: TextStyle(
              fontSize: AppDimens.dimens_18, fontWeight: AppFont.semiBold),
        ),
        const SizedBox(
          height: AppDimens.dimens_24,
        ),
        BlocBuilder<ScheduleCubit, ScheduleState>(
          builder: (context, state) {
            List<Map<String, Map<String, String>>> listMap = getList(
                state.allWorkoutSchedulel,
                listDateTime.indexWhere(
                  (element) =>
                      DateFormat('E').format(DateTime.now()) ==
                      DateFormat('E').format(element),
                ));
            return listMap.isEmpty
                ? const Center(
                    child: Column(
                    children: [
                      Text(
                        'Trống',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: AppDimens.dimens_18,
                            fontWeight: AppFont.semiBold),
                      ),
                      Text(
                        '(Không có kế hoạch tập nào ngày hôm nay)',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: AppDimens.dimens_14,
                            fontWeight: AppFont.medium),
                      ),
                    ],
                  ))
                : SizedBox(
                    height: AppDimens.dimens_104,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: AppDimens.dimens_104,
                            width: AppDimens.dimens_96,
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppDimens.dimens_8),
                            child: Column(
                              children: [
                                Column(
                                  children: [
                                    SizedBox(
                                      height: AppDimens.dimens_64,
                                      width: AppDimens.dimens_64,
                                      child: Stack(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        AppDimens.dimens_24),
                                                gradient: LinearGradient(
                                                    colors: [
                                                      AppColor.pink,
                                                      AppColor.pink
                                                          .withOpacity(0.5)
                                                    ],
                                                    begin: Alignment.topCenter,
                                                    end: Alignment
                                                        .bottomCenter)),
                                          ),
                                          Center(
                                            child: Image.asset(
                                              getNameAndImage(
                                                  listMap[index].keys.first,
                                                  image,
                                                  name)[0],
                                              width: AppDimens.dimens_36,
                                              height: AppDimens.dimens_36,
                                              color: AppColor.white,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: AppDimens.dimens_16,
                                    ),
                                    SizedBox(
                                      height: AppDimens.dimens_24,
                                      child: Text(
                                        getNameAndImage(
                                            listMap[index].keys.first,
                                            image,
                                            name)[1],
                                        style: const TextStyle(
                                            fontSize: AppDimens.dimens_14,
                                            fontWeight: AppFont.semiBold),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: listMap.length,
                    ),
                  );
          },
        ),
      ],
    );
  }
}

List<String> getNameAndImage(
    String nameMethod, List<String> image, List<String> name) {
  switch (nameMethod) {
    case AppString.inTheGym:
      return [image[0], name[0]];
    case AppString.calisthenics:
      return [image[1], name[1]];
    default:
      return [image[2], name[2]];
  }
}
