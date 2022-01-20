import 'package:flutter/material.dart';
import 'package:travelonline/theme/theme_config.dart';
import 'package:travelonline/widgets/widgets.dart';

class KTextButtonOnlyText extends StatelessWidget {
  const KTextButtonOnlyText(
      {Key? key,
      required this.text,
      this.size = 22,
      required this.onClick,
      this.textColor})
      : super(key: key);
  final String text;
  final double size;
  final Color? textColor;
  final Function onClick;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: () {
          onClick();
        },
        child: KText(
          text: text,
          size: size,
          tColor: textColor,
        ),
        style: TextButton.styleFrom(
            backgroundColor: ThemeConfig.getAccent(),
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(vertical: 13)),
      ),
    );
  }
}
