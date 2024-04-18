import 'package:bloc/bloc.dart';

class FirstCubit extends Cubit<int> {
  FirstCubit() : super(0);
  resetValue() {
    emit(0);
  }

  newValue() {
    emit(state + 1);
  }
}
