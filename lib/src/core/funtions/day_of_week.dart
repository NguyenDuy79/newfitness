import 'package:intl/intl.dart';

List<DateTime> getWeek(DateTime dateTime) {
  List<DateTime> listDateTime = [];
  switch (dateTime.weekday) {
    case 1:
      for (int i = 0; i < 7; i++) {
        listDateTime.add(DateTime.parse(
            DateFormat('yyyy-MM-dd').format(dateTime.add(Duration(days: i)))));
      }
      return listDateTime;

    case 2:
      listDateTime.add(DateTime.parse(DateFormat('yyyy-MM-dd')
          .format(dateTime.subtract(const Duration(days: 1)))));
      for (int i = 0; i < 6; i++) {
        listDateTime.add(DateTime.parse(
            DateFormat('yyyy-MM-dd').format(dateTime.add(Duration(days: i)))));
      }
      return listDateTime;
    case 3:
      for (int i = 2; i > 0; i--) {
        listDateTime.add(DateTime.parse(DateFormat('yyyy-MM-dd')
            .format(dateTime.subtract(Duration(days: i)))));
      }
      for (int j = 0; j < 5; j++) {
        listDateTime.add(DateTime.parse(
            DateFormat('yyyy-MM-dd').format(dateTime.add(Duration(days: j)))));
      }
      return listDateTime;
    case 4:
      for (int i = 3; i > 0; i--) {
        listDateTime.add(DateTime.parse(DateFormat('yyyy-MM-dd')
            .format(dateTime.subtract(Duration(days: i)))));
      }
      for (int j = 0; j < 4; j++) {
        listDateTime.add(DateTime.parse(
            DateFormat('yyyy-MM-dd').format(dateTime.add(Duration(days: j)))));
      }
      return listDateTime;
    case 5:
      for (int i = 4; i > 0; i--) {
        listDateTime.add(DateTime.parse(DateFormat('yyyy-MM-dd')
            .format(dateTime.subtract(Duration(days: i)))));
      }
      for (int j = 0; j < 3; j++) {
        listDateTime.add(DateTime.parse(
            DateFormat('yyyy-MM-dd').format(dateTime.add(Duration(days: j)))));
      }
      return listDateTime;
    case 6:
      for (int i = 5; i > 0; i--) {
        listDateTime.add(DateTime.parse(DateFormat('yyyy-MM-dd')
            .format(dateTime.subtract(Duration(days: i)))));
      }
      for (int j = 0; j < 2; j++) {
        listDateTime.add(DateTime.parse(
            DateFormat('yyyy-MM-dd').format(dateTime.add(Duration(days: j)))));
      }
      return listDateTime;
    default:
      for (int i = 6; i > 0; i--) {
        listDateTime.add(DateTime.parse(DateFormat('yyyy-MM-dd')
            .format(dateTime.subtract(Duration(days: i)))));
      }

      listDateTime
          .add(DateTime.parse(DateFormat('yyyy-MM-dd').format(dateTime)));

      return listDateTime;
  }
}
