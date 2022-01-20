import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'en_us.dart';
import 'vi_vn.dart';

class TranslationService extends Translations {
  static Locale? get locale => Get.deviceLocale;
  static const fallbackLocale = Locale('vi', 'vn');
  @override
  Map<String, Map<String, String>> get keys => {
        'en_vn': enUS,
        'vi_vn': viVN,
      };
}
