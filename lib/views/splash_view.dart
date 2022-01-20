import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelonline/routes/pages.dart';
import 'package:travelonline/utils/constants.dart';

class SplashView extends GetView {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final splash_vm = Get.find<SplashViewModel>();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 3), () {
        Get.offNamed(Routes.login);
      });
    });
    return AnnotatedRegion(
      value: lightSystemUiOverlayStyle,
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              color: Constants.splashPageBgc,
              child: Image.asset(
                "assets/images/splash.jpg",
                fit: BoxFit.fitHeight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
