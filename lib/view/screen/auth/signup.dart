import 'package:first_project/core/class/handlingdataview.dart';
import 'package:first_project/core/constant/colors.dart';
import 'package:first_project/core/constant/imageasset.dart';
import 'package:first_project/core/function/validator.dart';
import 'package:first_project/view/widget/auth/customtextbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/signup_controller.dart';
import '../../../core/share/customtextformfield.dart';
import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/custombuttonsocialmedia.dart';
import '../../widget/auth/customsubtitleauth.dart';
import '../../widget/auth/customtitleauth.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpController());
    return Scaffold(
        body: GetBuilder<SignUpController>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Form(
                    key: controller.formState,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ListView(children: [
                        Container(
                          margin: const EdgeInsets.only(top: 30),
                          height: 100,
                          child: Image.asset(
                            AppImageAsset.logo,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Container(
                            alignment: Alignment.center,
                            child: CustomTitleAuth(
                              text: "Create An Account",
                              color: AppColor.primaryColor,
                              size: 18,
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomSubtitleAuth(
                                text: "Name", color: AppColor.primaryColor),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextFormField(
                              validator: (value) {
                                return validator(
                                    min: 3,
                                    max: 255,
                                    type: "username",
                                    value: value!);
                              },
                              controller: controller.name,
                              hintText: "Enter Username",
                              prefixIcon: Icons.person_outline,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
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
                              prefixIcon: Icons.lock_outline,
                              suffixIcon: controller.appear == true
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              password: controller.appear,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomSubtitleAuth(
                                text: "Phone", color: AppColor.primaryColor),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextFormField(
                              validator: (value) {
                                return validator(
                                    min: 10,
                                    max: 255,
                                    type: "phonenumber",
                                    value: value!);
                              },
                              number: true,
                              controller: controller.phone,
                              hintText: "Enter Phone",
                              prefixIcon: Icons.call_outlined,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomAuthButton(
                              text: "SIGN UP",
                              onPressed: () {
                                controller.signUp();
                              },
                            ),
                            const SizedBox(
                              height: 20,
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
                                  "Have an account already?",
                                  style: TextStyle(
                                      fontSize: 14, color: AppColor.black),
                                ),
                                CustomTextButton(
                                    onPressed: () {
                                      controller.goToPageLogIn();
                                    },
                                    text: "Log in",
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
