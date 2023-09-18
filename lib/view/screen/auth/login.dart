import 'package:first_project/controller/auth/login_controller.dart';
import 'package:first_project/core/class/handlingdataview.dart';
import 'package:first_project/core/constant/colors.dart';
import 'package:first_project/core/constant/imageasset.dart';
import 'package:first_project/core/function/validator.dart';
import 'package:first_project/view/widget/auth/customtextbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../core/share/customtextformfield.dart';
import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/custombuttonsocialmedia.dart';
import '../../widget/auth/customsubtitleauth.dart';
import '../../widget/auth/customtextbutton.dart';
import '../../widget/auth/customtitleauth.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
        body: GetBuilder<LoginController>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Form(
                    key: controller.formState,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ListView(children: [
                        Container(
                          margin: const EdgeInsets.only(top: 60),
                          height: 100,
                          child: Image.asset(
                            AppImageAsset.logo,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Container(
                            alignment: Alignment.center,
                            child: CustomTitleAuth(
                              text: "Welcome Back",
                              color: AppColor.primaryColor,
                              size: 20,
                            )),
                        Container(
                            alignment: Alignment.center,
                            child: CustomSubtitleAuth(
                              text: "Login to continue",
                              color: AppColor.primaryColor,
                            )),
                        const SizedBox(
                          height: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomSubtitleAuth(
                                text: "Email Address",
                                color: AppColor.primaryColor),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextFormField(
                              validator: (value) {
                                return validator(
                                    min: 7,
                                    max: 255,
                                    type: "email",
                                    value: value!);
                              },
                              controller: controller.email,
                              hintText: "Enter Email Address",
                              prefixIcon: Icons.mail_outline,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomSubtitleAuth(
                                text: "Password", color: AppColor.primaryColor),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextFormField(
                              validator: (value) {
                                return validator(
                                    min: 3, max: 255, type: "", value: value!);
                              },
                              controller: controller.password,
                              hintText: "Enter Password",
                              onPressedSuffixIcon: () {
                                controller.showHidePassword();
                              },
                              prefixIcon: Icons.lock,
                              suffixIcon: controller.appear == true
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              password: controller.appear,
                            ),
                            CustomTextButton(
                              text: "Forget Password?",
                              onPressed: () {
                                controller.goToPageForgetPassword();
                              },
                              color: AppColor.primaryColor,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomAuthButton(
                              text: "Login",
                              onPressed: () {
                                controller.login();
                              },
                            ),
                            const SizedBox(
                              height: 80,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomButtonSocialMedia(
                                  svgName: AppImageAsset.google,
                                  onTap: () {
                                    controller.signInWithGoogle();
                                  },
                                ),
                                CustomButtonSocialMedia(
                                  svgName: AppImageAsset.facebook,
                                  onTap: () {
                                    controller.signInWithFacebook();
                                  },
                                ),
                                CustomButtonSocialMedia(
                                  svgName: AppImageAsset.twitter,
                                  onTap: () {
                                    controller.signInWithTwitter();
                                  },
                                ),
                                CustomButtonSocialMedia(
                                  svgName: AppImageAsset.github,
                                  onTap: () {
                                    controller.signInWithGitHub(context);
                                  },
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Don’t have an account? ",
                                  style: TextStyle(
                                      fontSize: 14, color: AppColor.black),
                                ),
                                CustomTextButton(
                                    onPressed: () {
                                      controller.goToPageSignUp();
                                    },
                                    text: "Sign up now",
                                    color: AppColor.primaryColor),
                              ],
                            )
                          ],
                        )
                      ]),
                    ),
                  ),
                )));
  }
}
