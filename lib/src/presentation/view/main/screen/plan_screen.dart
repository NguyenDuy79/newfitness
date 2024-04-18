import 'package:fitness_nutrition/src/config/route/route_generator_route.dart';
import 'package:fitness_nutrition/src/core/funtions/get_list_method.dart';
import 'package:fitness_nutrition/src/core/resource/app_another.dart';
import 'package:fitness_nutrition/src/core/resource/app_string.dart';
import 'package:fitness_nutrition/src/domain/entities/workout_schedule.dart';
import 'package:fitness_nutrition/src/presentation/bloc/schedule_cubit/schedule_cubit.dart';
import 'package:fitness_nutrition/src/presentation/view/main/cubit/extend_exercise_method/extend_exercise_method_cubit.dart';
import 'package:fitness_nutrition/src/presentation/view/main/widget/plan_widget/list_exercise_widget.dart';
import 'package:fitness_nutrition/src/presentation/view/main/widget/plan_widget/plan_item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../../core/funtions/day_of_week.dart';
import '../../../../core/resource/app_colors.dart';
import '../../../../core/resource/app_dimens.dart';
import '../../../../core/resource/app_fonts.dart';
import '../cubit/schedule_screen_cubit/schedule_screen_cubit.dart';
import '../widget/nutrition_widget.dart/calendar_item.dart';

class PlanScreen extends StatelessWidget {
  const PlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<DateTime> listDateTime = getWeek(DateTime.now());
    Size sizeScreen = MediaQuery.of(context).size;
    return SafeArea(
        child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.dimens_24, vertical: AppDimens.dimens_16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<ScheduleCubit, ScheduleState>(
              builder: (context, stateSche) {
                return BlocBuilder<ScheduleScreenCubit, int>(
                  builder: (context, state) {
                    return SizedBox(
                        height:
                            (sizeScreen.width - AppDimens.dimens_24 * 2) / 7,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            for (int i = 0; i < 7; i++)
                              CalendarItemWidget(
                                  sizeScreen,
                                  listDateTime[i],
                                  i == state,
                                  i,
                                  true,
                                  false,
                                  getList(stateSche.allWorkoutSchedulel, i)
                                          .length ==
                                      1)
                          ],
                        ));
                  },
                );
              },
            ),
            const SizedBox(
              height: AppDimens.dimens_16,
            ),
            BlocBuilder<ScheduleCubit, ScheduleState>(
              builder: (context, state) {
                WorkoutSchedule? workoutScheduleIndex =
                    indexWorkoutSchedule(state.allWorkoutSchedulel);
                return BlocBuilder<ScheduleScreenCubit, int>(
                  builder: (context, stateInt) {
                    List<Map<String, Map<String, String>>> listNow =
                        getList(state.allWorkoutSchedulel, stateInt);

                    return SizedBox(
                      height: AppDimens.dimens_230,
                      child: workoutScheduleIndex == null
                          ? const Center(
                              child: Text(
                                'EMPTY',
                                style: TextStyle(
                                    fontSize: AppDimens.dimens_35,
                                    fontWeight: AppFont.semiBold,
                                    color: AppColor.black),
                              ),
                            )
                          : listNow.isEmpty
                              ? const Center(
                                  child: Text(
                                    'DAY OFF',
                                    style: TextStyle(
                                        fontSize: AppDimens.dimens_35,
                                        fontWeight: AppFont.semiBold,
                                        color: AppColor.black),
                                  ),
                                )
                              : SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Center(
                                        child: SizedBox(
                                          height: AppDimens.dimens_28,
                                          child: Text(
                                            'Kế hoạch  ${getPlanDay(stateInt, listDateTime)}',
                                            style: const TextStyle(
                                                fontSize: AppDimens.dimens_18,
                                                fontWeight: AppFont.medium),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                          height: AppDimens.dimens_200,
                                          child: ListView.builder(
                                              padding: const EdgeInsets.all(
                                                  AppDimens.dimens_0),
                                              itemCount: listNow.length,
                                              itemBuilder: (context, index) {
                                                return BlocBuilder<
                                                    ExtendExerciseMethodCubit,
                                                    ExtendExerciseMethodState>(
                                                  builder:
                                                      (context, stateExtend) {
                                                    return Column(
                                                      children: [
                                                        CupertinoButton(
                                                            child: Row(
                                                              children: [
                                                                Text(
                                                                  listNow[index]
                                                                      .keys
                                                                      .first,
                                                                  style: const TextStyle(
                                                                      color: AppColor
                                                                          .black),
                                                                ),
                                                                const SizedBox(
                                                                  width: AppDimens
                                                                      .dimens_5,
                                                                ),
                                                                Icon(
                                                                  stateExtend
                                                                          .listIndex
                                                                          .contains(
                                                                              index)
                                                                      ? Icons
                                                                          .arrow_drop_up_outlined
                                                                      : Icons
                                                                          .arrow_drop_down,
                                                                  color: AppColor
                                                                      .black,
                                                                ),
                                                              ],
                                                            ),
                                                            onPressed: () {
                                                              context
                                                                  .read<
                                                                      ExtendExerciseMethodCubit>()
                                                                  .addAndRemoveIndex(
                                                                      index);
                                                            }),
                                                        if (stateExtend
                                                            .listIndex
                                                            .contains(index))
                                                          ListExerciseWidget(
                                                              listNow[index])
                                                      ],
                                                    );
                                                  },
                                                );
                                              })),
                                    ],
                                  ),
                                ),
                    );
                  },
                );
              },
            ),
            const SizedBox(
              height: AppDimens.dimens_16,
            ),
            const Text(
              'Lịch tập luyện ',
              style: TextStyle(
                  fontSize: AppDimens.dimens_18, fontWeight: AppFont.semiBold),
            ),
            const SizedBox(
              height: AppDimens.dimens_24,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(RouteGenerator.setPlanScreen);
              },
              child: Container(
                height: AppDimens.dimens_104,
                margin: const EdgeInsets.only(bottom: AppDimens.dimens_16),
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: AppDimens.dimens_1,
                        color: AppColor.pink.withOpacity(0.5)),
                    borderRadius: BorderRadius.circular(AppDimens.dimens_24)),
                child: const Icon(
                  Icons.add_circle_outline_sharp,
                  size: AppDimens.dimens_42,
                  color: AppColor.pink,
                ),
              ),
            ),
            BlocBuilder<ScheduleCubit, ScheduleState>(
                builder: (context, state) {
              return SizedBox(
                height: (AppDimens.dimens_104 + AppDimens.dimens_16) *
                    state.allWorkoutSchedulel.length,
                width: double.infinity,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.allWorkoutSchedulel.length,
                  reverse: true,
                  itemBuilder: (context, index) {
                    return PlanItemWidget(index, state.allWorkoutSchedulel);
                  },
                ),
              );
            }),
            const SizedBox(
              height: AppDimens.dimens_72,
            )
          ],
        ),
      ),
    ));
  }
}

List<String> getListExerciseOfMuscle(
    String muscleGroup, List<String> listExercise) {
  List<String> newList = [];
  switch (muscleGroup) {
    case AppString.chest:
      for (String item in listExercise) {
        if (AppAnother.chestExercise.contains(item)) {
          newList.add(item);
        }
      }
    case AppString.arm:
      for (String item in listExercise) {
        if (AppAnother.armExercise.contains(item)) {
          newList.add(item);
        }
      }
    case AppString.back:
      for (String item in listExercise) {
        if (AppAnother.backExercise.contains(item)) {
          newList.add(item);
        }
      }
    case AppString.shoulder:
      for (String item in listExercise) {
        if (AppAnother.shoulderExercise.contains(item)) {
          newList.add(item);
        }
      }
    case AppString.core:
      for (String item in listExercise) {
        if (AppAnother.coreCalisExericse.contains(item)) {
          newList.add(item);
        }
      }
    case AppString.legAndGlutes:
      for (String item in listExercise) {
        if (AppAnother.legAndGlutesExercise.contains(item)) {
          newList.add(item);
        }
      }
    case AppString.chestAndTriceps:
      for (String item in listExercise) {
        if (AppAnother.chestAndTricepsExercise.contains(item)) {
          newList.add(item);
        }
      }
    case AppString.backAndBiceps:
      for (String item in listExercise) {
        if (AppAnother.backAndBicepsExercise.contains(item)) {
          newList.add(item);
        }
      }
    case AppString.legAndGlutesCalis:
      for (String item in listExercise) {
        if (AppAnother.legAndGlutesCalisExercsie.contains(item)) {
          newList.add(item);
        }
      }
    case AppString.shoulderCalis:
      for (String item in listExercise) {
        if (AppAnother.shoulderCalisExercise.contains(item)) {
          newList.add(item);
        }
      }
    default:
  }
  return newList;
}

int totalDayWorkout(WorkoutSchedule workoutSchedule) {
  List allData = [
    workoutSchedule.mon,
    workoutSchedule.tue,
    workoutSchedule.wed,
    workoutSchedule.thu,
    workoutSchedule.fri,
    workoutSchedule.sat,
    workoutSchedule.sun
  ];
  int result = 0;
  for (int i = 0; i < allData.length; i++) {
    if (allData[i].isNotEmpty) {
      result++;
    }
  }
  return result;
}

int totalExercise(WorkoutSchedule workoutSchedule) {
  List allData = [
    workoutSchedule.mon,
    workoutSchedule.tue,
    workoutSchedule.wed,
    workoutSchedule.thu,
    workoutSchedule.fri,
    workoutSchedule.sat,
    workoutSchedule.sun
  ];
  int result = 0;
  for (int i = 0; i < allData.length; i++) {
    if (allData[i].isNotEmpty) {
      result += totalExercisePerday(allData[i]);
    }
  }

  return result;
}

int totalExercisePerday(List<Map<String, Map<String, String>>> map) {
  int result = 0;
  if (map.isNotEmpty) {
    for (int i = 0; i < map.length; i++) {
      if (map[i].keys.first == AppString.cardio) {
        if (map[i].values.first['hiitMethod'] != null) {
          result += map[i].values.first.keys.length - 2;
        } else {
          result += map[i].values.first.keys.length - 1;
        }
      } else {
        result += map[i].values.first.keys.length;
      }
    }
  }
  return result;
}

WorkoutSchedule? indexWorkoutSchedule(List<WorkoutSchedule> listSche) {
  WorkoutSchedule? result;
  if (listSche.isEmpty) {
    return null;
  } else {
    for (int i = 0; i < listSche.length; i++) {
      if (listSche[i].check) {
        result = listSche[i];
      }
    }
  }
  return result;
}

Widget exercise(List<String> muscleGroup, String name, BuildContext context) {
  return Column(
    children: [
      if (muscleGroup.isNotEmpty)
        SizedBox(
          height: AppDimens.dimens_28,
          child: Row(
            children: [
              const SizedBox(
                width: AppDimens.dimens_30,
              ),
              Text(
                '- $name:',
                style: const TextStyle(
                    fontSize: AppDimens.dimens_18, fontWeight: AppFont.medium),
              ),
            ],
          ),
        ),
      if (muscleGroup.isNotEmpty)
        SizedBox(
          height: muscleGroup.length * AppDimens.dimens_24,
          width: double.infinity,
          child: ListView.builder(
            padding: const EdgeInsets.all(AppDimens.dimens_0),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: muscleGroup.length,
            itemBuilder: (context, index) {
              return Row(children: [
                const SizedBox(
                  width: AppDimens.dimens_60,
                ),
                Padding(
                  padding: const EdgeInsets.all(AppDimens.dimens_2),
                  child: Text(
                    '+ ${muscleGroup[index]}.',
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ]);
            },
          ),
        ),
    ],
  );
}

int totalMuscleGroupGym(List<String> excercise) {
  int result = 0;
  for (int i = 0; i < excercise.length; i++) {
    for (List<String> item in AppAnother.exercise.values.toList()) {
      if (item.contains(excercise[i])) {
        result++;
        continue;
      }
    }
  }
  return result;
}

int totalMuscleGroupCalis(List<String> excercise) {
  int result = 0;
  for (int i = 0; i < excercise.length; i++) {
    for (List<String> item in AppAnother.exerciseCalis.values.toList()) {
      if (item.contains(excercise[i])) {
        result++;
        continue;
      }
    }
  }
  return result;
}

Widget gym(
    List<String> back,
    List<String> chest,
    List<String> arm,
    List<String> core,
    List<String> legAndGlutes,
    List<String> shoulder,
    BuildContext context) {
  return Column(
    children: [
      exercise(back, AppString.back, context),
      exercise(chest, AppString.chest, context),
      exercise(arm, AppString.arm, context),
      exercise(legAndGlutes, AppString.legAndGlutes, context),
      exercise(shoulder, AppString.shoulder, context),
      exercise(core, AppString.core, context),
    ],
  );
}

Widget calisthenic(List<String> back, List<String> chest, List<String> core,
    List<String> legAndGlutes, List<String> shoulder, BuildContext context) {
  return Column(
    children: [
      exercise(back, AppString.backAndBiceps, context),
      exercise(chest, AppString.chestAndTriceps, context),
      exercise(legAndGlutes, AppString.legAndGlutesCalis, context),
      exercise(shoulder, AppString.shoulderCalis, context),
      exercise(core, AppString.core, context),
    ],
  );
}

String getPlanDay(int stateInt, List<DateTime> listDateTime) {
  return (listDateTime.indexWhere((element) =>
              DateFormat('E').format(DateTime.now()) ==
              DateFormat('E').format(element)) ==
          stateInt)
      ? 'hôm nay'
      : DateFormat('dd/MM').format(listDateTime[stateInt]);
}
