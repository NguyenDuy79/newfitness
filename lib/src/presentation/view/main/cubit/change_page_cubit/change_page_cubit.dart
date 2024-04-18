import 'package:bloc/bloc.dart';

class ChangePageCubit extends Cubit<int> {
  ChangePageCubit() : super(0);
  void changePage(int index) {
    emit(index);
  }
}
