import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'set_weight_state.dart';

class SetWeightCubit extends Cubit<SetWeightState> {
  SetWeightCubit() : super(const SetWeightState());

  onChangeValueDouble(String value) {
    if (value.isNotEmpty) {
      if (value.contains(' ')) {
        emit(state.copyWith(errorText: 'Làm ơn nhập đúng giá trị'));
      } else if (value.contains('.')) {
        if (value.split('.').length > 2) {
          emit(state.copyWith(errorText: 'Làm ơn nhập đúng giá trị'));
        } else {
          if (value.split('.')[0].isEmpty || value.split('.')[1].isEmpty) {
            emit(state.copyWith(errorText: 'Làm ơn nhập đúng giá trị'));
          } else {
            emit(state.copyWith(weight: double.parse(value)));
          }
        }
      } else {
        emit(state.copyWith(weight: double.parse(value)));
      }
    } else {
      emit(state.copyWith(errorText: ''));
    }
  }

  onChangeValueString(String value, List<String> name) {
    if (value.isEmpty) {
      emit(state.copyWith(errorText: 'Làm ơn nhập tên'));
    } else if (name.contains(value)) {
      emit(state.copyWith(errorText: 'Làm ơn nhập tên khác'));
    } else {
      emit(state.copyWith(errorText: '', name: value));
    }
  }
}
