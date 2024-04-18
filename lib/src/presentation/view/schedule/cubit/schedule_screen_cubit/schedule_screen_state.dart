part of 'schedule_screen_cubit.dart';

class ScheduleScreenMainState extends Equatable {
  const ScheduleScreenMainState(
      {this.allDay = const [
        AppString.monday,
        AppString.tuesday,
        AppString.wednesday,
        AppString.thursday,
        AppString.friday,
        AppString.saturday,
        AppString.sunday,
      ],
      this.mon = const [],
      this.tue = const [],
      this.wed = const [],
      this.thu = const [],
      this.fri = const [],
      this.sat = const [],
      this.sun = const [],
      this.countDay = -1,
      this.countMethod = 0,
      this.cardioMethod = '',
      this.chooseExerciseCardio = false,
      this.hiitMethod = '',
      this.levelError = ''});
  final List<String> allDay;
  final List<Map<String, Map<String, String>>> mon;
  final List<Map<String, Map<String, String>>> tue;
  final List<Map<String, Map<String, String>>> wed;
  final List<Map<String, Map<String, String>>> thu;
  final List<Map<String, Map<String, String>>> fri;
  final List<Map<String, Map<String, String>>> sat;
  final List<Map<String, Map<String, String>>> sun;
  final int countDay;
  final int countMethod;
  final String cardioMethod;
  final String hiitMethod;
  final bool chooseExerciseCardio;
  final String levelError;
  ScheduleScreenMainState copyWith(
      {List<String>? allDay,
      List<Map<String, Map<String, String>>>? mon,
      List<Map<String, Map<String, String>>>? tue,
      List<Map<String, Map<String, String>>>? wed,
      List<Map<String, Map<String, String>>>? thu,
      List<Map<String, Map<String, String>>>? fri,
      List<Map<String, Map<String, String>>>? sat,
      List<Map<String, Map<String, String>>>? sun,
      int? countDay,
      int? countMethod,
      String? cardioMethod,
      String? hiitMethod,
      int? hiitLevel,
      int? hiitCurrentLevel,
      String? levelError,
      bool? chooseExerciseCardio}) {
    return ScheduleScreenMainState(
        allDay: allDay ?? this.allDay,
        mon: mon ?? this.mon,
        tue: tue ?? this.tue,
        wed: wed ?? this.wed,
        thu: thu ?? this.thu,
        fri: fri ?? this.fri,
        sat: sat ?? this.sat,
        sun: sun ?? this.sun,
        countDay: countDay ?? this.countDay,
        countMethod: countMethod ?? this.countMethod,
        cardioMethod: cardioMethod ?? this.cardioMethod,
        hiitMethod: hiitMethod ?? this.hiitMethod,
        levelError: levelError ?? this.levelError,
        chooseExerciseCardio:
            chooseExerciseCardio ?? this.chooseExerciseCardio);
  }

  @override
  List<Object> get props => [
        allDay,
        mon,
        tue,
        wed,
        thu,
        fri,
        sat,
        sun,
        countDay,
        countMethod,
        cardioMethod,
        hiitMethod,
        chooseExerciseCardio
      ];
}
