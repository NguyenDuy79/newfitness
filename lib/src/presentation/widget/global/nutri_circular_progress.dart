import 'package:fitness_nutrition/src/presentation/widget/global/circular_progress.dart';
import 'package:flutter/material.dart';
import '../../../core/resource/app_dimens.dart';
import '../../../core/resource/app_fonts.dart';
import '../../../core/resource/app_string.dart';

class NutriCircularProgress extends StatelessWidget {
  const NutriCircularProgress(
      {super.key,
      required this.percent,
      required this.radius,
      required this.color,
      required this.opacity,
      required this.fontWeight,
      required this.fontSize,
      required this.text,
      required this.label,
      required this.value,
      required this.textLabelSize,
      required this.textValueSize});
  final double percent;
  final double radius;
  final Color color;
  final double opacity;
  final FontWeight fontWeight;
  final double fontSize;
  final String text;
  final String label;
  final double value;
  final double textLabelSize;
  final double textValueSize;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircularPercentWidget(radius, color, text, percent, fontSize,
            fontWeight, opacity, AppDimens.dimens_5),
        const SizedBox(
          width: AppDimens.dimens_8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                  fontWeight: AppFont.semiBold, fontSize: textLabelSize),
            ),
            Text(
              '${value.toStringAsFixed(1)}${label == AppString.calories ? 'kcal' : 'g'}',
              style: TextStyle(fontSize: textValueSize),
            )
          ],
        ),
      ],
    );
  }
}
