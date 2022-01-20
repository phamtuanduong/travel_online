import 'package:flutter/material.dart';
import 'package:travelonline/theme/theme_config.dart';

class KText extends StatelessWidget {
  const KText(
      {Key? key,
      required this.text,
      this.tColor,
      this.size = 17,
      this.isBold = false,
      this.isCenter = false})
      : super(key: key);
  final String text;
  final Color? tColor;
  final double size;
  final bool isBold;
  final bool isCenter;

  @override
  Widget build(BuildContext context) {
    var fontWeight = FontWeight.normal;

    if (isBold) {
      fontWeight = FontWeight.bold;
    }
    return Text(
      text,
      textAlign: isCenter ? TextAlign.center : null,
      style: TextStyle(color: tColor, fontSize: size, fontWeight: fontWeight),
    );
  }
}
