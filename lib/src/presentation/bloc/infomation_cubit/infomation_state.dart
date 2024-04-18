part of 'infomation_cubit.dart';

class InfomationState extends Equatable {
  const InfomationState(this.listInfomation, this.check, this.status);
  final List<Infomation> listInfomation;
  final int check;
  final FormzSubmissionStatus status;
  @override
  List<Object> get props => [listInfomation, check, status];
}
