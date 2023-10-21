import 'package:first_project/controller/auth/socialmediasharedsignupandlogin_controller.dart';
import 'package:first_project/core/constant/routes.dart';
import 'package:first_project/core/constant/statusrequest.dart';
import 'package:first_project/core/function/handlingdata.dart';
import 'package:first_project/data/remote/auth/login_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/function/fcmconfig.dart';

class LoginController extends SocialMediaSharedSignupAndLogin {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  bool appear = true;
  showHidePassword() {
    appear = !appear;
    update();
  }

  goToPageSignUp() {
    Get.offNamed(AppRoute.signup);
  }

  goToPageForgetPassword() {
    Get.toNamed(AppRoute.forgetpassword);
  }

  LoginData loginData = LoginData();
  login() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData
          .getData({"email": email.text, "password": password.text});
      print(
          "=======================Response Controller===========================$response");
      statusRequest = handlingData(response);
      update();
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "failure") {
          // statusRequest = StatusRequest.failure;
          return Get.defaultDialog(
              title: "Warning", content: const Text("Email OR Passsord Wrong"));
        } else if (response['status'] == "failureverifycode") {
          Get.toNamed(AppRoute.verifycodesignup,
              arguments: {"email": email.text});
        } else if (response['status'] == "success") {
          myServices.sharedPreferences.setString("idlogin", "1");

          Get.offNamed(AppRoute.homepage);
        }
      }
    }
    update();
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    getToken();
    // TODO: implement onInit
    super.onInit();
  }
}
