import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelonline/core/viewmodels/view_models.dart';
import 'package:travelonline/routes/pages.dart';
import 'package:travelonline/theme/theme_config.dart';
import 'package:travelonline/utils/constants.dart';
import 'package:travelonline/widgets/widgets.dart';

class LoginView extends GetView<AuthViewModel> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final controller = Get.find<AuthViewModel>();
    return Scaffold(
      backgroundColor: ThemeConfig.bgAccent,
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
                    child: Form(
                      key: _formKey,
                      child: Container(
                        padding: const EdgeInsets.all(Constants.dkp / 2),
                        height: Constants.screenHeight / 1.5,
                        width: double.infinity,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Constants.boxPadding(height: Constants.dkp / 2),
                              KText(
                                text:
                                    "Chào mừng bạn đến với ứng dụng\n✈️Du lịch trực tuyến!💕",
                                isCenter: true,
                                size: 20,
                                isBold: true,
                                tColor: ThemeConfig.getAccent(),
                              ),
                              Constants.boxPadding(height: Constants.dkp * 2.5),
                              GetBuilder<AuthViewModel>(
                                init: controller,
                                id: 'no_find_account',
                                builder: (_) {
                                  if (controller.noFindAccount) {
                                    return KText(
                                      text: 'no_have_account'.tr,
                                      size: 14,
                                      tColor: Colors.red,
                                    );
                                  }
                                  return Constants.boxPadding();
                                },
                              ),
                              KTextField(
                                hideText: "Tên đăng nhập/email",
                                onSaved: (value) {
                                  if (value!.contains('@')) {
                                    controller.email = value;
                                  } else {
                                    controller.username = value;
                                  }
                                },
                                onChanged: (value) {
                                  controller.username = value;
                                  if (controller.noFindAccount) {
                                    controller.noFindAccount = false;
                                    controller.update(['no_find_account']);
                                  }
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'empty_name'.tr;
                                  }
                                },
                              ),
                              Constants.boxPadding(height: Constants.dkp * 1.5),
                              KTextField(
                                  hideText: 'password'.tr,
                                  obscureText: true,
                                  onChanged: (value) {
                                    controller.password = value;
                                    if (controller.noFindAccount) {
                                      controller.noFindAccount = false;
                                      controller.update(['no_find_account']);
                                    }
                                  },
                                  onSaved: (value) {
                                    controller.password = value;
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'empty_password'.tr;
                                    } else {
                                      if (controller.password != null &&
                                          controller.password!.length < 6) {
                                        return 'illegal_password'.tr;
                                      }
                                    }

                                    return null;
                                  }),
                              Constants.boxPadding(height: Constants.dkp * 2),
                              KTextButtonOnlyText(
                                text: 'login'.tr,
                                onClick: () {
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                    Constants.hideKeyboard();
                                    controller.signIn();
                                  }
                                },
                                textColor: Colors.white,
                              ),
                              Constants.boxPadding(height: Constants.dkp),
                              GestureDetector(
                                onTap: () {},
                                child: KText(
                                  text: 'forget_password'.tr,
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
                                      text: 'or'.tr,
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
                                    onClick: () {
                                      controller.signInWithGoogleAccount();
                                    },
                                  ),
                                  Constants.boxPadding(
                                      width: Constants.dkp * 2),
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
                                  KText(
                                    text: 'no_account'.tr,
                                    tColor: Colors.grey,
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Get.toNamed(Routes.register);
                                    },
                                    child: KText(
                                      text: 'register_now'.tr,
                                      tColor: ThemeConfig.getAccent(),
                                    ),
                                    style: TextButton.styleFrom(
                                        primary: ThemeConfig.getNotPrimary()),
                                  )
                                ],
                              ),
                              Constants.boxPadding(height: Constants.dkp),
                              GetBuilder<AuthViewModel>(
                                init: controller,
                                id: 'action_loading',
                                builder: (_) => ConditionWidget(
                                  controller.isAction,
                                  child: const CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: ThemeConfig.bgAccent,
                                  ),
                                ),
                              ),
                            ],
                          ),
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
