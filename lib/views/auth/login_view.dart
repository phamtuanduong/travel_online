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
      backgroundColor: ThemeConfig.darkAccent,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Column(
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
                      width: 220,
                    ),
                  ],
                ),
                Constants.boxPadding(height: Constants.dkp / 2),
                Expanded(
                  child: Container(
                    child: SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.all(Constants.dkp / 2),
                        height: Constants.screenHeight / 1.5,
                        width: double.infinity,
                        child: Column(
                          children: [
                            KText(
                              text:
                                  "Chào mừng bạn đến với ứng dụng\n✈️Du lịch trực tuyến!💕",
                              isCenter: true,
                              size: 20,
                              isBold: true,
                              tColor: ThemeConfig.getAccent(),
                            ),
                            Constants.boxPadding(height: Constants.dkp * 2.5),
                            KTextField(
                                hideText: "Tên đăng nhập/email",
                                onSubmitted: (value) {}),
                            Constants.boxPadding(height: Constants.dkp * 1.5),
                            KTextField(
                                hideText: "Mật khẩu", onSubmitted: (value) {}),
                            Constants.boxPadding(height: Constants.dkp * 2),
                            KTextButtonOnlyText(
                              text: "Đăng nhập",
                              onClick: () {},
                              textColor: Colors.white,
                            ),
                            Constants.boxPadding(height: Constants.dkp),
                            GestureDetector(
                              onTap: () {},
                              child: KText(
                                text: "Quên mật khẩu?",
                                size: 18,
                                tColor: ThemeConfig.color54(),
                              ),
                            ),
                            Constants.boxPadding(height: Constants.dkp * 2.5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 1,
                                  width: Constants.screenWidth / 4,
                                  color: Colors.grey,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: Constants.dkp / 2),
                                  child: KText(
                                    text: "HOẶC",
                                    size: 17,
                                    tColor: ThemeConfig.colorGreyAndWhite54(),
                                  ),
                                ),
                                Container(
                                  height: 1,
                                  width: Constants.screenWidth / 4,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                            Constants.boxPadding(height: Constants.dkp),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _ThirdLoginButton(
                                  text: "Google",
                                  icon: "google",
                                  onClick: () {},
                                ),
                                Constants.boxPadding(width: Constants.dkp * 2),
                                _ThirdLoginButton(
                                  text: "Facebook",
                                  icon: "facebook",
                                  onClick: () {},
                                ),
                              ],
                            ),
                            Constants.boxPadding(height: Constants.dkp),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const KText(
                                  text: "Bạn chưa có tài khoản?",
                                  tColor: Colors.grey,
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: KText(
                                    text: "Đăng ký ngay",
                                    tColor: ThemeConfig.getAccent(),
                                  ),
                                  style: TextButton.styleFrom(
                                      primary: ThemeConfig.getNotPrimary()),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: ThemeConfig.getPrimary(),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(Constants.dkp * 2),
                            topRight: Radius.circular(Constants.dkp * 2))),
                  ),
                )
              ],
            ),
            Positioned(
              top: Constants.screenHeight / 5.4,
              left: Constants.dkp,
              child: Image.asset(
                'assets/images/logo_x0_5.png',
                width: 120,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ThirdLoginButton extends StatelessWidget {
  const _ThirdLoginButton({
    Key? key,
    required this.text,
    required this.icon,
    this.onClick,
  }) : super(key: key);
  final String text;
  final String icon;
  final Function()? onClick;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Row(
        children: [
          Image.asset(
            'assets/icons/$icon.png',
            width: 25,
          ),
          Constants.boxPadding(width: Constants.dkp / 2),
          KText(
            text: text,
            size: 18,
            tColor: ThemeConfig.color54(),
          ),
        ],
      ),
    );
  }
}
