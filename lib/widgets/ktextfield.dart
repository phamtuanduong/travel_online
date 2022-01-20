import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelonline/theme/theme_config.dart';

class KTextField extends StatelessWidget {
  const KTextField({
    Key? key,
    this.hideText,
    this.onSubmitted,
    this.textSize = 14,
  }) : super(key: key);
  final String? hideText;
  final Function(String)? onSubmitted;
  final double textSize;
  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontSize: 17);
    return TextField(
      onSubmitted: onSubmitted,
      style: style,
      cursorColor:
          ThemeConfig.compareColor(Colors.black12, ThemeConfig.lightPrimary),
      decoration: InputDecoration(
          fillColor: ThemeConfig.compareColor(
              Colors.grey.shade200, Colors.grey.shade700),
          filled: true,
          hintText: hideText,
          hintStyle: style,
          isDense: true,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(200))),
    );
  }
}
