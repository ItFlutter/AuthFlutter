import 'package:first_project/core/constant/colors.dart';
import 'package:first_project/core/constant/imageasset.dart';
import 'package:first_project/view/widget/auth/custombuttonauth.dart';
import 'package:first_project/view/widget/auth/customsubtitleauth.dart';
import 'package:first_project/view/widget/auth/customtitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/auth/resetpassword/successresetpassword_controller.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SuccessResetPasswordController controller =
        Get.put(SuccessResetPasswordController());
    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: CustomAuthButton(
          text: "Proceed",
          onPressed: () {
            controller.goToPageLogin();
          },
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          CustomTitleAuth(
              text: "Password reset successfull",
              size: 20,
              color: AppColor.black),
          Container(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 60),
            alignment: Alignment.center,
            child: CustomSubtitleAuth(
              text: "You can now login with your\n new password.",
              color: AppColor.grey2,
              center: true,
            ),
          ),
          Image.asset(AppImageAsset.success),
        ],
      ),
    );
  }
}
