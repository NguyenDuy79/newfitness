part of 'infomation_body_dart_cubit.dart';

class InfomationBodyDartState extends Equatable {
  const InfomationBodyDartState(
      {this.index = 0,
      this.gender = '',
      this.goal = '',
      this.bodyShape = 2,
      this.dateOfBirth = '',
      this.height = 165,
      this.weight = 75,
      this.cm = true,
      this.kg = true,
      this.bodyFat = '28',
      this.startChooseHeightCm = 65,
      this.startChooseHeightFt = 26,
      this.dayTraining = AppString.dayTraining1,
      this.valid = '',
      this.startChooseWeightKg = 140,
      this.startChooseWeightIbs = 308,
      this.heightWidget = 0,
      this.widthtWidget = 0,
      this.protein = 35,
      this.fat = 30,
      this.carbs = 35,
      this.trainingExperience = -1,
      this.previousImport = false,
      this.isImportBodyFat = false});
  final int index;

  final String gender;
  final String goal;
  final int bodyShape;
  final String dateOfBirth;
  final String valid;
  final int height;
  final bool cm;
  final String bodyFat;
  final double weight;
  final bool kg;
  final int carbs;
  final int protein;
  final int fat;
  final bool previousImport;
  final String dayTraining;
  final int trainingExperience;
  final bool isImportBodyFat;
  final int startChooseHeightFt;
  final int startChooseHeightCm;
  final int startChooseWeightKg;
  final int startChooseWeightIbs;
  final double heightWidget;
  final double widthtWidget;
  InfomationBodyDartState copyWith({
    int? index,
    String? gender,
    String? goal,
    int? bodyShape,
    String? dateOfBirth,
    int? height,
    double? weight,
    bool? cm,
    bool? kg,
    String? dayTraining,
    String? bodyFat,
    int? trainingExperience,
    int? startChooseHeightCm,
    int? startChooseHeightFt,
    int? protein,
    int? fat,
    int? carbs,
    int? startChooseWeightKg,
    int? startChooseWeightIbs,
    double? heightWidget,
    double? widthtWidget,
    String? valid,
    bool? previousImport,
    bool? isImportBodyFat,
  }) {
    return InfomationBodyDartState(
        index: index ?? this.index,
        gender: gender ?? this.gender,
        goal: goal ?? this.goal,
        bodyShape: bodyShape ?? this.bodyShape,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        height: height ?? this.height,
        weight: weight ?? this.weight,
        cm: cm ?? this.cm,
        kg: kg ?? this.kg,
        bodyFat: bodyFat ?? this.bodyFat,
        dayTraining: dayTraining ?? this.dayTraining,
        isImportBodyFat: isImportBodyFat ?? this.isImportBodyFat,
        valid: valid ?? this.valid,
        protein: protein ?? this.protein,
        fat: fat ?? this.fat,
        carbs: carbs ?? this.carbs,
        previousImport: previousImport ?? this.previousImport,
        startChooseHeightCm: startChooseHeightCm ?? this.startChooseHeightCm,
        startChooseHeightFt: startChooseHeightFt ?? this.startChooseHeightFt,
        startChooseWeightIbs: startChooseWeightIbs ?? this.startChooseWeightIbs,
        startChooseWeightKg: startChooseWeightKg ?? this.startChooseWeightKg,
        trainingExperience: trainingExperience ?? this.trainingExperience,
        heightWidget: heightWidget ?? this.heightWidget,
        widthtWidget: widthtWidget ?? this.widthtWidget);
  }

  @override
  List<Object> get props => [
        index,
        gender,
        goal,
        bodyShape,
        dateOfBirth,
        height,
        cm,
        weight,
        kg,
        dayTraining,
        trainingExperience,
        bodyFat,
        isImportBodyFat,
        valid,
        startChooseHeightCm,
        startChooseHeightFt,
        startChooseWeightIbs,
        startChooseWeightKg,
        protein,
        fat,
        carbs,
        heightWidget,
        widthtWidget,
        previousImport
      ];
}
