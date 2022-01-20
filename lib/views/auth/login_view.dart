import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelonline/core/view_models/auth_view_model.dart';
import 'package:travelonline/theme/theme_config.dart';
import 'package:travelonline/utils/constants.dart';
import 'package:travelonline/widgets/widgets.dart';

class LoginView extends GetView<AuthViewModel> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeConfig.lightAccent,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: Constants.dkp),
                  child: KText(
                    text: 'login'.tr,
                    size: 38,
                    isBold: true,
                    tColor: ThemeConfig.lightPrimary,
                  ),
                ),
                Image.asset(
                  'assets/images/login_art.png',
                  width: 200,
                ),
              ],
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(Constants.dkp / 2),
                child: Column(
                  children: [
                    KTextField(
                        hideText: "Tên đăng nhập/email",
                        onSubmitted: (value) {}),
                    Constants.boxPadding(height: Constants.dkp / 2),
                    KTextField(hideText: "Mật khẩu", onSubmitted: (value) {})
                  ],
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: ThemeConfig.getPrimary(),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(Constants.dkp * 2),
                        topRight: Radius.circular(Constants.dkp * 2))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
