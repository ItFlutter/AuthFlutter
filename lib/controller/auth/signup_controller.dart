import 'package:first_project/controller/auth/socialmediasharedsignupandlogin_controller.dart';
import 'package:first_project/core/constant/routes.dart';
import 'package:first_project/core/constant/statusrequest.dart';
import 'package:first_project/core/function/handlingdata.dart';
import 'package:first_project/data/remote/auth/signup_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends SocialMediaSharedSignupAndLogin {
  bool appear = true;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController name;
  late TextEditingController phone;
  showHidePassword() {
    appear = !appear;
    update();
  }

  goToPageLogIn() {
    Get.offNamed(AppRoute.login);
  }

  SignUpData signUpData = SignUpData();
  signUp() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signUpData.insertData({
        "name": name.text,
        "email": email.text,
        "password": password.text,
        "phone": phone.text
      });
      print(
          "=======================Response Controller===========================$response");
      statusRequest = handlingData(response);
      update();
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "failureverifycode") {
          Get.toNamed(AppRoute.verifycodesignup,
              arguments: {"email": email.text});
          //Go to verify
          // statusRequest = StatusRequest.failure;

        } else if (response['status'] == "failureemail") {
          Get.defaultDialog(
              title: "Warning",
              content: const Text("The Email Already Exists"));
        } else if (response['status'] == "success") {
          Get.toNamed(AppRoute.verifycodesignup,
              arguments: {"email": email.text});
        }
      }
    }
    update();
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    name = TextEditingController();
    phone = TextEditingController();
    // TODO: implement onInit
    super.onInit();
  }
}
