import 'package:equatable/equatable.dart';

import '../../core/resource/app_string.dart';

class Water with EquatableMixin {
  Water({
    required this.key,
    required this.dateTime,
    required this.valueEachHour,
  });
  final int key;
  final String dateTime;
  final Map<String, int> valueEachHour;
  Map<String, dynamic> toMap() =>
      {AppString.dateTime: dateTime, AppString.valueEachHour: valueEachHour};
  @override
  List<Object?> get props => [dateTime, valueEachHour, key];
}
