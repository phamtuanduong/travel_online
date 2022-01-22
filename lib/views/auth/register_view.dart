import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelonline/core/viewmodels/view_models.dart';
import 'package:travelonline/theme/theme_config.dart';
import 'package:travelonline/utils/constants.dart';
import 'package:travelonline/widgets/widgets.dart';

class RegisterView extends GetView<AuthViewModel> {
  const RegisterView({Key? key}) : super(key: key);
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
                        text: 'register'.tr,
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
                              Constants.boxPadding(height: Constants.dkp * 2),
                              GetBuilder<AuthViewModel>(
                                init: controller,
                                id: 'username_validator',
                                builder: (_) => Column(
                                  children: [
                                    if (controller.haveUserName != null)
                                      KText(
                                        text: "${controller.haveUserName}",
                                        size: 14,
                                        tColor: Colors.red,
                                      ),
                                    KTextField(
                                      initialValue: "dst",
                                      hideText: 'have_user_name'.tr,
                                      onChanged: (value) {
                                        controller.username = value;
                                        if (controller.haveUserName != null) {
                                          controller.haveUserName = null;
                                          controller
                                              .update(["username_validator"]);
                                        }
                                      },
                                      onSaved: (value) {
                                        controller.username = value;
                                      },
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'empty_name'.tr;
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Constants.boxPadding(height: Constants.dkp * 1.5),
                              GetBuilder<AuthViewModel>(
                                init: controller,
                                id: 'email_validator',
                                builder: (_) => Column(
                                  children: [
                                    if (controller.haveEmail != null)
                                      KText(
                                        text: "${controller.haveEmail}",
                                        size: 14,
                                        tColor: Colors.red,
                                      ),
                                    KTextField(
                                      initialValue: "dst@gmail.com",
                                      hideText:
                                          "Email: mikado@example@gmail.com",
                                      onChanged: (value) {
                                        controller.email = value;
                                        if (controller.haveEmail != null) {
                                          controller.haveEmail = null;
                                          controller
                                              .update(["email_validator"]);
                                        }
                                      },
                                      onSaved: (value) {
                                        controller.email = value;
                                      },
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'empty_email'.tr;
                                        } else {
                                          if (controller.email != null &&
                                              !controller.email!
                                                  .contains('@')) {
                                            return 'illegal_email'.tr;
                                          }
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Constants.boxPadding(height: Constants.dkp * 1.5),
                              KTextField(
                                  initialValue: "123456",
                                  hideText: 'password'.tr,
                                  obscureText: true,
                                  onChanged: (value) {
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
                                  }),
                              Constants.boxPadding(height: Constants.dkp * 1.5),
                              KTextField(
                                  initialValue: "123456",
                                  hideText: 're_password'.tr,
                                  obscureText: true,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'empty_password'.tr;
                                    } else {
                                      if (value != controller.password) {
                                        return 'renot_password'.tr;
                                      }
                                    }
                                  }),
                              Constants.boxPadding(height: Constants.dkp * 2),
                              KTextButtonOnlyText(
                                text: 'register'.tr,
                                onClick: () {
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                    controller.signUpWithEmailAndPassword();
                                  }
                                },
                                textColor: Colors.white,
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
                                    onClick: () {},
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
                                      Get.back();
                                    },
                                    child: KText(
                                      text: 'login_now'.tr,
                                      tColor: ThemeConfig.getAccent(),
                                    ),
                                    style: TextButton.styleFrom(
                                        primary: ThemeConfig.getNotPrimary()),
                                  )
                                ],
                              ),
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
