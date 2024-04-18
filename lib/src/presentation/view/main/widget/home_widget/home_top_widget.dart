import 'package:fitness_nutrition/src/core/resource/app_string.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../core/resource/app_colors.dart';
import '../../../../../core/resource/app_dimens.dart';
import '../../../../../core/resource/app_fonts.dart';

class HomeTopWidget extends StatelessWidget {
  const HomeTopWidget(this.name, this.listDateTime, {super.key});
  final String name;
  final List<DateTime> listDateTime;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.dimens_24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              height: AppDimens.dimens_58,
              width: AppDimens.dimens_58,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: AppColor.pink),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  alignment: Alignment.center,
                  height: AppDimens.dimens_24,
                  child: Text(
                    'Xin chào $name',
                    style: const TextStyle(fontSize: 14),
                  )),
              Container(
                alignment: Alignment.center,
                height: AppDimens.dimens_28,
                child: Text(
                  dateTimeString(DateFormat('EEE/dd/MM')
                      .format(listDateTime[listDateTime.indexWhere(
                        (element) =>
                            DateFormat('E').format(DateTime.now()) ==
                            DateFormat('E').format(element),
                      )])
                      .toString()),
                  style: const TextStyle(
                      fontSize: 18, fontWeight: AppFont.semiBold),
                ),
              )
            ],
          ),
          Container(
            height: AppDimens.dimens_58,
            width: AppDimens.dimens_58,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border: Border.all(
                    width: AppDimens.dimens_1,
                    color: AppColor.black.withOpacity(0.1)),
                shape: BoxShape.circle),
            child: const Icon(
              Icons.notifications_none,
              size: AppDimens.dimens_24,
            ),
          )
        ],
      ),
    );
  }
}

String dateTimeString(String dateTime) {
  switch (dateTime.split('/')[0]) {
    case AppString.mon:
      return 'Thứ 2, ${dateTime.split('/')[1]} Tháng ${dateTime.split('/')[2]}';
    case AppString.tue:
      return 'Thứ 3, ${dateTime.split('/')[1]} Tháng ${dateTime.split('/')[2]}';
    case AppString.wed:
      return 'Thứ 4, ${dateTime.split('/')[1]} Tháng ${dateTime.split('/')[2]}';
    case AppString.thu:
      return 'Thứ 5, ${dateTime.split('/')[1]} Tháng ${dateTime.split('/')[2]}';
    case AppString.fri:
      return 'Thứ 6, ${dateTime.split('/')[1]} Tháng ${dateTime.split('/')[2]}';
    case AppString.sat:
      return 'Thứ 7, ${dateTime.split('/')[1]} Tháng ${dateTime.split('/')[2]}';
    default:
      return 'Chủ nhật, ${dateTime.split('/')[1]} Tháng ${dateTime.split('/')[2]}';
  }
}
