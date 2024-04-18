import 'package:bloc/bloc.dart';

class MainPageIndexCubit extends Cubit<int> {
  MainPageIndexCubit() : super(0);
  void changePage(int index) {
    emit(index);
  }
}
