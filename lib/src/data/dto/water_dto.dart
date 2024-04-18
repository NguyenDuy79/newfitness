import '../../core/resource/app_string.dart';
import '../../domain/entities/water.dart';

class WaterDto extends Water {
  WaterDto(
      {required super.dateTime,
      required super.valueEachHour,
      required super.key});
  factory WaterDto.fromJson(int key, Map<String, dynamic> json) {
    Map<String, int> result = {};
    for (int i = 0;
        i < (json[AppString.valueEachHour]).keys.toList().length;
        i++) {
      result.addAll({
        (json[AppString.valueEachHour]).keys.toList()[i]:
            (json[AppString.valueEachHour]).values.toList()[i]
      });
    }
    return WaterDto(
        key: key, dateTime: json[AppString.dateTime], valueEachHour: result);
  }
}
