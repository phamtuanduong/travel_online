import 'package:flutter/material.dart';
import 'package:travelonline/utils/constants.dart';

class ConditionWidget extends StatelessWidget {
  const ConditionWidget(this.conditon, {Key? key, required this.child})
      : super(key: key);
  final Widget child;
  final bool conditon;
  @override
  Widget build(BuildContext context) {
    if (conditon) {
      return child;
    }
    return Constants.boxPadding();
  }
}
