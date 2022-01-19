import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';
import 'package:travel_online/utils/constants.dart';
import 'package:travel_online/views/splash_view.dart';

import 'core/initial_binding.dart';
import 'lang/translation_service.dart';
import 'routes/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  void hideKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus!.unfocus();
    }
  }

  void _subscribeConnectivityChange() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      switch (result) {
        case ConnectivityResult.wifi:
          'use_wifi'.tr.toast();
          break;
        case ConnectivityResult.mobile:
          'use_mobile'.tr.toast();
          break;
        case ConnectivityResult.none:
          'disconnect_wifi'.tr.toast();
          break;
        case ConnectivityResult.ethernet:
          'use_ethernet'.tr.toast();
          break;
        case ConnectivityResult.bluetooth:
          break;
      }
    });
  }

  GetMaterialApp _getMaterialApp() {
    return GetMaterialApp(
      title: 'tilte_app'.tr,
      initialRoute: '/',
      initialBinding: InitialBinding(),
      navigatorObservers: [GetObserver(), FlutterSmartDialog.observer],
      builder: (context, child) {
        return FlutterSmartDialog(
          child: OKToast(
              position: const ToastPosition(
                align: Alignment.bottomCenter,
                offset: -72.0,
              ),
              child: Scaffold(
                // Nhấn vào chỗ trống để tắt bàn phím điện thoại
                body: GestureDetector(
                  onTap: () {
                    hideKeyboard(context);
                  },
                  child: child,
                ),
              )),
        );
      },
      getPages: Pages.routes,
      locale: TranslationService.locale,
      fallbackLocale: TranslationService.fallbackLocale,
      translations: TranslationService(),
      home: const SplashView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    FlutterSmartDialog.monitor();
    if (isMobile) {
      _subscribeConnectivityChange();
    }
    return _getMaterialApp();
  }
}
