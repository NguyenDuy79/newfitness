import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CircularPercentWidget extends StatelessWidget {
  const CircularPercentWidget(this.radius, this.color, this.text, this.percent,
      this.fontSize, this.fontWeight, this.opacity, this.lineWidth,
      {super.key});
  final double radius;
  final Color color;
  final String text;
  final double percent;
  final double fontSize;
  final FontWeight fontWeight;
  final double opacity;
  final double lineWidth;
  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: radius,
      backgroundColor: color.withOpacity(opacity),
      percent: percent,
      progressColor: color,
      lineWidth: lineWidth,
      center: SizedBox(
        width: radius * 2,
        child: Text(
          text,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: fontWeight, fontSize: fontSize),
        ),
      ),
    );
  }
}
