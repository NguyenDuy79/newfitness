import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:intl/intl.dart';

import '../../../../../core/resource/app_dimens.dart';
import '../../../../../core/resource/app_string.dart';

part 'infomation_body_dart_state.dart';

class InfomationBodyDartCubit extends Cubit<InfomationBodyDartState> {
  InfomationBodyDartCubit() : super(const InfomationBodyDartState());
  void changeIndex(int index) {
    emit(state.copyWith(index: index));
  }

  Future<void> setGender(
    String gender,
  ) async {
    emit(state.copyWith(
        gender: gender,
        widthtWidget: AppDimens.dimens_10,
        heightWidget: AppDimens.dimens_10));
    await Future.delayed(const Duration(milliseconds: 250), () {
      emit(state.copyWith(
          heightWidget: AppDimens.dimens_0, widthtWidget: AppDimens.dimens_0));
    });
  }

  Future<void> setGoal(String goal) async {
    emit(state.copyWith(
        goal: goal,
        widthtWidget: AppDimens.dimens_10,
        heightWidget: AppDimens.dimens_5));
    await Future.delayed(const Duration(milliseconds: 250), () {
      emit(state.copyWith(
          heightWidget: AppDimens.dimens_0, widthtWidget: AppDimens.dimens_0));
    });
  }

  void setBodyShape(int bodyShape) {
    emit(state.copyWith(
      bodyShape: bodyShape,
    ));
  }

  void setBodyFat(String bodyFat) {
    emit(state.copyWith(bodyFat: bodyFat));
  }

  void setDateOfBirth(DateTime dateTime) {
    emit(
        state.copyWith(dateOfBirth: DateFormat('yyyy/MM/dd').format(dateTime)));
  }

  void setHeight(int height) {
    int ft = (height / 2.54).round();

    emit(state.copyWith(
        height: height,
        startChooseHeightCm: height - 100,
        startChooseHeightFt: ft - 39));
  }

  void setWeight(double weight) {
    emit(state.copyWith(
        weight: weight,
        startChooseWeightKg: (weight * 10 - 610).round(),
        startChooseWeightIbs: (weight * 22.046 - 1345).round()));
  }

  void changeCm(bool cm) {
    emit(state.copyWith(
      cm: cm,
    ));
  }

  void changeKg(bool kg) {
    emit(state.copyWith(kg: kg));
  }

  void setDayTraining(String dayTraining) {
    emit(state.copyWith(dayTraining: dayTraining));
  }

  void changeImportBodyFat(bool import) {
    emit(state.copyWith(isImportBodyFat: import));
  }

  void changePreviousImport(bool import) {
    emit(state.copyWith(previousImport: import));
  }

  void checkValid(String value) {
    if (value.trim().isNotEmpty) {
      if (value.trim().contains('.') || value.trim().contains(' ')) {
        emit(state.copyWith(valid: 'Hãy nhập đúng phần trăm mỡ đúng'));
      } else if (int.parse(value.trim()) >= 90 ||
          int.parse(value.trim()) < 16) {
        emit(state.copyWith(
            valid:
                'Hãy nhập số lớn hơn ${state.gender == AppString.male ? 7 : 16} và nhỏ hơn 100'));
      } else {
        emit(state.copyWith(valid: ''));
      }
    } else {
      emit(state.copyWith(valid: ''));
    }
  }

  void setProtein(int value) {
    emit(state.copyWith(protein: value));
  }

  void setHeightAndWidth(double height, double width) {
    emit(state.copyWith(heightWidget: height, widthtWidget: width));
  }

  void setFat(int value) {
    emit(state.copyWith(fat: value));
  }

  void setCarb(int value) {
    emit(state.copyWith(carbs: value));
  }

  // Future<void> enterInfomation(Map<String, dynamic> map) async {
  //   emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
  //   try {
  //     await _insretDataUseCase.call(params: map);
  //     _insretDataUseCase.onChange();
  //     emit(state.copyWith(status: FormzSubmissionStatus.success));
  //     log('done');
  //   } catch (error) {
  //     log(error.toString());
  //     emit(state.copyWith(status: FormzSubmissionStatus.failure));
  //   }
  // }
}
