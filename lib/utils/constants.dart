export 'app_const.dart';
export 'extension.dart';

import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';

class Constants {
  static const Color splashPageBgc = Color(0xF21C2F54);

  // 主题颜色
  static const Color defaultColor = Color(0xFFFE5767);

  // 浅色主题颜色
  static const Color defaultLightColor = Color(0xFFFFABB8);

  static final MediaQueryData mediaQueryData =
      MediaQueryData.fromWindow(window);

  static final Size screenSize = mediaQueryData.size;

  static final double screenWidth = screenSize.width;

  static final double screenHeight = screenSize.height;

  static Widget boxPadding({double width = 0, double height = 0}) {
    return SizedBox(
      height: height,
      width: width,
    );
  }

  static bool isMobile() {
    bool kisweb;
    try {
      if (Platform.isAndroid || Platform.isIOS) {
        kisweb = false;
      } else {
        kisweb = true;
      }
    } catch (e) {
      kisweb = true;
    }
    return !kisweb;
  }

  static BuildContext? buildContext;

  static void hideKeyboard() {
    FocusScopeNode currentFocus = FocusScope.of(buildContext!);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus!.unfocus();
    }
  }

  //default padding
  static const double dkp = 20.0;
  const Constants._();
}
