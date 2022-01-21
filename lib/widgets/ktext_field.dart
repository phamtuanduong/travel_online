import 'package:flutter/material.dart';
import 'package:travelonline/theme/theme_config.dart';

class KTextField extends StatelessWidget {
  const KTextField({
    Key? key,
    this.hideText,
    this.textSize = 14,
    this.isDense = true,
    this.validator,
    this.onSaved,
    this.initialValue = '',
    this.keyboardType,
    this.obscureText = false,
    this.onChanged,
  }) : super(key: key);
  final String? hideText;
  final double textSize;
  final bool isDense;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;
  final String initialValue;
  final TextInputType? keyboardType;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontSize: 17);
    return TextFormField(
      onSaved: onSaved,
      keyboardType: keyboardType,
      obscureText: obscureText,
      initialValue: initialValue,
      validator: validator,
      onChanged: onChanged,
      style: style,
      cursorColor:
          ThemeConfig.compareColor(Colors.black12, ThemeConfig.lightPrimary),
      decoration: InputDecoration(
          fillColor: ThemeConfig.compareColor(
              Colors.grey.shade200, Colors.grey.shade700),
          filled: true,
          hintText: hideText,
          hintStyle: style,
          isDense: isDense,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(200))),
    );
  }
}
