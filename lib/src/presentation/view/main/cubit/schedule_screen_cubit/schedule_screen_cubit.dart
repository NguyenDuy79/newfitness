import 'package:bloc/bloc.dart';

class ScheduleScreenCubit extends Cubit<int> {
  ScheduleScreenCubit() : super(0);
  void changePage(int index) {
    emit(index);
  }
}
