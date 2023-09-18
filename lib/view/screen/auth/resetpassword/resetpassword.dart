import 'package:first_project/core/class/handlingdataview.dart';
import 'package:first_project/core/constant/colors.dart';
import 'package:first_project/core/function/validator.dart';
import 'package:first_project/core/share/customtextformfield.dart';
import 'package:first_project/view/widget/auth/custombuttonauth.dart';
import 'package:first_project/view/widget/auth/customtitleauth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../controller/auth/resetpassword/resetpassword_controller.dart';
import '../../../widget/auth/customsubtitleauth.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ResetPasswordController controller = Get.put(ResetPasswordController());
    return Scaffold(
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: CustomAuthButton(
            text: "Submit",
            onPressed: () {
              controller.updatePassword();
            },
          ),
        ),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: AppColor.black,
              )),
        ),
        body: GetBuilder<ResetPasswordController>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Form(
                  key: controller.formstate,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListView(children: [
                      Container(
                          padding: const EdgeInsets.only(bottom: 40),
                          alignment: Alignment.center,
                          child: CustomTitleAuth(
                              text: "Reset password", color: AppColor.black)),
                      CustomSubtitleAuth(
                          text: "New Password", color: AppColor.primaryColor),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                        validator: (value) {
                          return validator(
                              min: 3, max: 255, type: "", value: value!);
                        },
                        controller: controller.password,
                        hintText: "Enter Password",
                        onPressedSuffixIcon: () {
                          controller.showHidePassword(true);
                        },
                        prefixIcon: Icons.lock,
                        suffixIcon: controller.appear == true
                            ? Icons.visibility
                            : Icons.visibility_off,
                        password: controller.appear,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomSubtitleAuth(
                          text: "Confirm New Password",
                          color: AppColor.primaryColor),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                        validator: (value) {
                          return validator(
                              min: 3, max: 255, type: "", value: value!);
                        },
                        controller: controller.repassword,
                        hintText: "Enter RePassword",
                        onPressedSuffixIcon: () {
                          controller.showHidePassword(false);
                        },
                        prefixIcon: Icons.lock,
                        suffixIcon: controller.appearRePassword == true
                            ? Icons.visibility
                            : Icons.visibility_off,
                        password: controller.appearRePassword,
                      ),
                    ]),
                  ),
                ))));
  }
}
