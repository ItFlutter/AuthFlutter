import 'package:first_project/core/constant/routes.dart';
import 'package:first_project/core/constant/statusrequest.dart';
import 'package:first_project/core/function/handlingdata.dart';
import 'package:first_project/data/remote/auth/resetpassword/resetpassword_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController email;
  StatusRequest statusRequest = StatusRequest.none;
  ResetPasswordData resetPasswordData = ResetPasswordData();
  check() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await resetPasswordData.getData({"email": email.text});
      statusRequest = handlingData(response);
      update();
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "failure") {
          return Get.defaultDialog(
              title: "Warning",
              content:
                  const Text("Email Not Valid or The email is not verified"));
        } else {
          Get.toNamed(AppRoute.verifycoderesetpassword,
              arguments: {"email": email.text});
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    // TODO: implement onInit
    super.onInit();
  }
}
