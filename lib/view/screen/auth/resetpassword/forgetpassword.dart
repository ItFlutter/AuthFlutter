import 'package:first_project/core/class/handlingdataview.dart';
import 'package:first_project/core/constant/colors.dart';
import 'package:first_project/core/function/validator.dart';
import 'package:first_project/core/share/customtextformfield.dart';
import 'package:first_project/view/widget/auth/custombuttonauth.dart';
import 'package:first_project/view/widget/auth/customsubtitleauth.dart';
import 'package:first_project/view/widget/auth/customtitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/auth/resetpassword/forgetpassword_controller.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordController());
    return Scaffold(
        body: GetBuilder<ForgetPasswordController>(
      builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Form(
            key: controller.formstate,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(top: 50, bottom: 10),
                    child: CustomTitleAuth(
                      text: "Forgot your Password?",
                      color: AppColor.black,
                      size: 22,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 40),
                    alignment: Alignment.center,
                    child: CustomSubtitleAuth(
                      text:
                          "Enter your email address and we will\n share a link to create a new password.",
                      color: AppColor.grey2,
                      center: true,
                    ),
                  ),
                  CustomTextFormField(
                      hintText: "Enter Email Address",
                      controller: controller.email,
                      validator: (value) {
                        return validator(
                            min: 7, max: 255, type: "email", value: value!);
                      }),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomAuthButton(
                    text: "Send",
                    onPressed: () {
                      controller.check();
                    },
                  )
                ],
              ),
            ),
          )),
    ));
  }
}
