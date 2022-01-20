import 'package:flutter/material.dart';

class KText extends StatelessWidget {
  const KText(
      {Key? key,
      required this.text,
      this.tColor,
      this.size = 12,
      this.isBold = false})
      : super(key: key);
  final String text;
  final Color? tColor;
  final double size;
  final bool isBold;

  @override
  Widget build(BuildContext context) {
    var fontWeight = FontWeight.normal;
    if (isBold) {
      fontWeight = FontWeight.bold;
    }
    return Text(
      text,
      style: TextStyle(color: tColor, fontSize: size, fontWeight: fontWeight),
    );
  }
}
