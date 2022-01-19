import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oktoast/oktoast.dart';
import 'package:travel_online/theme/theme_config.dart';
import 'package:travel_online/utils/constants.dart';
import 'package:travel_online/views/splash_view.dart';

import 'core/initial_binding.dart';
import 'lang/translation_service.dart';
import 'routes/pages.dart';

void main() async {
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

  ThemeData _themeData(ThemeData theme) {
    return theme.copyWith(
      textTheme: GoogleFonts.sourceSansProTextTheme(
        theme.textTheme,
      ),
    );
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
      //Chang mặc định theme ở đây
      themeMode: ThemeMode.system,
      theme: _themeData(ThemeConfig.lightTheme),
      darkTheme: _themeData(ThemeConfig.darkTheme),
      getPages: Pages.routes,
      //Ngôn ngữ ứng dụng
      locale: TranslationService.locale,
      fallbackLocale: TranslationService.fallbackLocale,
      translations: TranslationService(),
      //Trang bắt đầu
      home: const SplashView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    FlutterSmartDialog.monitor();
    //Kiểm tra kết nối mạng trên Android, IOS, nhưng skip trên Web
    if (Constants.isMobile()) {
      _subscribeConnectivityChange();
    }
    return _getMaterialApp();
  }
}
