import 'package:first_project/core/constant/imageasset.dart';
import 'package:first_project/view/widget/auth/custombuttonauth.dart';
import 'package:first_project/view/widget/auth/customtitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/successsignup.dart';
import '../../../core/constant/colors.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessSignUpController controller = Get.put(SuccessSignUpController());
    return Scaffold(
      body: Container(
        // width: Get.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomTitleAuth(
                text: "Success", color: AppColor.black.withOpacity(0.5)),
            Image.asset(AppImageAsset.success),
            CustomTitleAuth(text: "Success SignUp", color: AppColor.black),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CustomAuthButton(
                text: "Go To Login",
                onPressed: () {
                  controller.goToPageLogin();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
