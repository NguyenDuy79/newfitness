import 'package:fitness_nutrition/src/presentation/view/main/cubit/detail_schedule_cubit/detail_schedule_cubit.dart';
import 'package:fitness_nutrition/src/presentation/view/main/screen/plan_screen.dart';
import 'package:fitness_nutrition/src/presentation/view/main/widget/plan_widget/list_exercise_widget.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/resource/app_colors.dart';
import '../../../../../core/resource/app_dimens.dart';
import '../../../../../core/resource/app_string.dart';

class ListMethodAndExerciseWidget extends StatelessWidget {
  const ListMethodAndExerciseWidget(this.listNow, this.day, this.listIndex,
      {super.key});
  final List<Map<String, Map<String, String>>> listNow;
  final String day;
  final List<int> listIndex;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getHeight(listIndex, listNow),
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(AppDimens.dimens_0),
          itemCount: listNow.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                SizedBox(
                  height: AppDimens.dimens_38,
                  child: CupertinoButton(
                      padding: const EdgeInsets.symmetric(
                          vertical: AppDimens.dimens_4,
                          horizontal: AppDimens.dimens_24),
                      child: SizedBox(
                        child: Row(
                          children: [
                            Text(
                              listNow[index].keys.first,
                              style: const TextStyle(
                                  color: AppColor.black,
                                  fontSize: AppDimens.dimens_18),
                            ),
                            const SizedBox(
                              width: AppDimens.dimens_5,
                            ),
                            Icon(
                              listIndex.contains(index)
                                  ? Icons.arrow_drop_up_outlined
                                  : Icons.arrow_drop_down,
                              size: AppDimens.dimens_30,
                              color: AppColor.black,
                            ),
                          ],
                        ),
                      ),
                      onPressed: () {
                        context
                            .read<DetailScheduleCubit>()
                            .addAndRemoveIndex(day, index);
                      }),
                ),
                if (listIndex.contains(index))
                  ListExerciseWidget(listNow[index])
              ],
            );
          }),
    );
  }
}

double getHeight(List<int> index, List<Map<String, Map<String, String>>> list) {
  double result = 0;
  if (index.isEmpty) {
    return AppDimens.dimens_38 * list.length;
  } else {
    result = result + AppDimens.dimens_38 * list.length;
    for (int i = 0; i < list.length; i++) {
      if (index.contains(i)) {
        list[i].keys.first == AppString.inTheGym
            ? result = result +
                list[i].values.length * AppDimens.dimens_24 +
                totalMuscleGroupGym(list[i].values.first.values.toList()) *
                    AppDimens.dimens_28
            : list[i].keys.first == AppString.calisthenics
                ? result = result +
                    list[i].values.length * AppDimens.dimens_24 +
                    totalMuscleGroupCalis(
                            list[i].values.first.values.toList()) *
                        AppDimens.dimens_28
                : (list[i].values.first['hiitMethod'] == null ||
                        list[i].values.first['hiitMethod'] ==
                            AppString.sequentially)
                    ? result = result +
                        AppDimens.dimens_28 +
                        ((list[i].values.first.keys.length -
                                (list[i].values.first['hiitCardio'] == null
                                    ? 1
                                    : 2)) *
                            AppDimens.dimens_24)
                    : result = result +
                        AppDimens.dimens_28 +
                        int.parse(
                                list[i].values.first.keys.last.split('.')[0]) *
                            AppDimens.dimens_28 +
                        AppDimens.dimens_25 +
                        ((list[i].values.first.keys.length - 2) *
                            AppDimens.dimens_24);
      }
    }
  }
  return result;
}
