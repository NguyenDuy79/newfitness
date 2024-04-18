import 'package:fitness_nutrition/src/core/resource/app_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../../core/resource/app_dimens.dart';
import '../../../../../core/resource/app_string.dart';
import '../../screen/plan_screen.dart';

class ListExerciseWidget extends StatelessWidget {
  const ListExerciseWidget(this.listNow, {super.key});
  final Map<String, Map<String, String>> listNow;

  @override
  Widget build(BuildContext context) {
    return listNow.keys.first == AppString.inTheGym
        ? gym(
            getListExerciseOfMuscle(
                AppString.back, listNow.values.first.values.toList()),
            getListExerciseOfMuscle(
                AppString.chest, listNow.values.first.values.toList()),
            getListExerciseOfMuscle(
                AppString.arm, listNow.values.first.values.toList()),
            getListExerciseOfMuscle(
                AppString.core, listNow.values.first.values.toList()),
            getListExerciseOfMuscle(
                AppString.legAndGlutes, listNow.values.first.values.toList()),
            getListExerciseOfMuscle(
                AppString.shoulder, listNow.values.first.values.toList()),
            context)
        : listNow.keys.first == AppString.calisthenics
            ? calisthenic(
                getListExerciseOfMuscle(AppString.backAndBiceps,
                    listNow.values.first.values.toList()),
                getListExerciseOfMuscle(AppString.chestAndTriceps,
                    listNow.values.first.values.toList()),
                getListExerciseOfMuscle(
                    AppString.core, listNow.values.first.values.toList()),
                getListExerciseOfMuscle(AppString.legAndGlutesCalis,
                    listNow.values.first.values.toList()),
                getListExerciseOfMuscle(AppString.shoulderCalis,
                    listNow.values.first.values.toList()),
                context)
            : (listNow.values.first['hiitMethod'] == null ||
                    listNow.values.first['hiitMethod'] ==
                        AppString.sequentially)
                ? cardioNormal(listNow.values.first.values.toList())
                : cardioHiitGroup(listNow.values.first);
  }
}

Widget cardioHiitGroup(Map<String, String> map) {
  return Column(
    children: [
      SizedBox(
        height: AppDimens.dimens_28,
        child: Row(
          children: [
            const SizedBox(
              width: AppDimens.dimens_30,
            ),
            Text(
              '${map.values.first}:',
              style: const TextStyle(
                  fontWeight: AppFont.medium, fontSize: AppDimens.dimens_18),
            ),
          ],
        ),
      ),
      SizedBox(
          height: int.parse(map.keys.toList().last.split('.')[0]) *
                  AppDimens.dimens_28 +
              (map.values.toList().length - 2) * AppDimens.dimens_24,
          child: ListView.builder(
              padding: const EdgeInsets.all(AppDimens.dimens_0),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: int.parse(map.keys.toList().last.split('.')[0]),
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: AppDimens.dimens_28,
                      child: Row(
                        children: [
                          const SizedBox(
                            width: AppDimens.dimens_30,
                          ),
                          Text('- Mức độ ${index + 1}:',
                              style: const TextStyle(
                                  fontWeight: AppFont.medium,
                                  fontSize: AppDimens.dimens_18)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: getListExerciseEachLevel(map, index + 1).length *
                          AppDimens.dimens_24,
                      child: ListView.builder(
                        padding: const EdgeInsets.all(AppDimens.dimens_0),
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount:
                            getListExerciseEachLevel(map, index + 1).length,
                        itemBuilder: (context, indexExercise) => SizedBox(
                          height: AppDimens.dimens_24,
                          child: Row(
                            children: [
                              const SizedBox(
                                width: AppDimens.dimens_60,
                              ),
                              Text(
                                '+ ${getListExerciseEachLevel(map, index + 1)[indexExercise]}.',
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              })),
    ],
  );
}

List<String> getListExerciseEachLevel(Map<String, String> map, int level) {
  List<String> newList = [];
  for (int i = 0; i < map.length; i++) {
    if (map.keys.toList()[i].split('.')[0] == level.toString()) {
      newList.add(map.values.toList()[i]);
    }
  }
  return newList;
}

Widget cardioNormal(List<String> exercise) {
  return Column(
    children: [
      SizedBox(
        height: AppDimens.dimens_28,
        child: Row(
          children: [
            const SizedBox(
              width: AppDimens.dimens_30,
            ),
            Text(
              '- ${exercise[0]}:',
              style: const TextStyle(
                  fontWeight: AppFont.medium, fontSize: AppDimens.dimens_18),
            ),
          ],
        ),
      ),
      SizedBox(
        height: AppDimens.dimens_24 *
            (exercise.length - (exercise[1] == AppString.sequentially ? 2 : 1)),
        child: ListView.builder(
            padding: const EdgeInsets.all(AppDimens.dimens_0),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: exercise.length -
                (exercise[1] == AppString.sequentially ? 2 : 1),
            itemBuilder: (context, index) {
              return SizedBox(
                height: AppDimens.dimens_24,
                child: Row(
                  children: [
                    const SizedBox(
                      width: AppDimens.dimens_60,
                    ),
                    Text(
                        '+ ${exercise[index + (exercise[1] == AppString.sequentially ? 2 : 1)]}.'),
                  ],
                ),
              );
            }),
      ),
    ],
  );
}
