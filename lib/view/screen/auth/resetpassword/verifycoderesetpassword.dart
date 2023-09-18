import 'package:first_project/view/widget/auth/custombuttonauth.dart';
import 'package:first_project/view/widget/auth/customtitleauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import '../../../../controller/auth/resetpassword/verifycoderesetpassword_controller.dart';
import '../../../../core/constant/colors.dart';
import '../../../widget/auth/customtextbutton.dart';

class VerifyCodeResetPassword extends StatelessWidget {
  const VerifyCodeResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VerifyCodeResetPasswordController controller =
        Get.put(VerifyCodeResetPasswordController());
    return Scaffold(
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
          child: CustomAuthButton(
            text: "Submit",
            onPressed: () {
              controller.check();
            },
          ),
        ),
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
              ),
              onPressed: () {
                Get.back();
              },
            )),
        body: GetBuilder<VerifyCodeResetPasswordController>(
          builder: (controller) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: CustomTitleAuth(
                      text: "Verify your email address",
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 20, bottom: 60),
                    alignment: Alignment.center,
                    child: Text(
                      "We sent you a 4 digit code to verify\nyour email address (${controller.email}).\nEnter in the field below.",
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  OtpTextField(
                    borderRadius: BorderRadius.circular(8),

                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    borderWidth: 1.0,
                    fieldWidth: 60,

                    numberOfFields: 4,
                    borderColor: AppColor.primaryColor,
                    //set to true to show as box or false to show as dash
                    showFieldAsBox: true,
                    //runs when a code is typed in
                    // onCodeChanged: (String code) {
                    //   print(
                    //       "=============================================$code");
                    //   //handle validation or checks here
                    // },
                    //runs when every textfield is filled
                    onSubmit: (String verificationCode) {
                      controller.verifyCode = verificationCode;
                      // showDialog(
                      //     context: context,
                      //     builder: (context) {
                      //       return AlertDialog(
                      //         title: Text("Verification Code"),
                      //         content:
                      //             Text('Code entered is $verificationCode'),
                      //       );
                      //     });
                    }, // end onSubmit
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  GetX<VerifyCodeResetPasswordController>(
                    builder: (controller) => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Didn’t receive code?",
                          style: TextStyle(
                              fontSize: 14,
                              color: AppColor.black,
                              fontWeight: FontWeight.w600),
                        ),
                        controller.counter.value == 60
                            ? CustomTextButton(
                                onPressed: () {
                                  controller.resend();
                                  controller.waiting();
                                },
                                text: "Resend",
                                color: AppColor.primaryColor,
                                fontWeight: FontWeight.w600)
                            : Container(),
                      ],
                    ),
                  ),
                  GetX<VerifyCodeResetPasswordController>(
                    builder: (controller) => controller.counter.value != 60
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "You may request a new code in ",
                                style: TextStyle(
                                    fontSize: 14, color: AppColor.grey2),
                              ),
                              Text(
                                controller.counter.value.toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w800,
                                    color: AppColor.black.withOpacity(0.7)),
                              ),
                            ],
                          )
                        : Container(),
                  )
                ],
              )),
        ));
  }
}
