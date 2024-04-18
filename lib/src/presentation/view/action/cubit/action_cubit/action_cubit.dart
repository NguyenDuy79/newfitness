import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'action_state.dart';

class ActionCubit extends Cubit<ActionState> {
  ActionCubit() : super(const ActionState());
  void changePage(int index) {
    emit(state.copyWith(indexPage: index));
  }
}
