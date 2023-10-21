import 'package:first_project/core/constant/routes.dart';
import 'package:first_project/core/constant/statusrequest.dart';
import 'package:first_project/core/function/handlingdata.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/remote/auth/resetpassword/resetpassword_data.dart';

class ResetPasswordController extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  bool appear = true;
  bool appearRePassword = true;
  late String email;
  showHidePassword(bool password) {
    password ? appear = !appear : appearRePassword = !appearRePassword;
    update();
  }

  StatusRequest statusRequest = StatusRequest.none;
  late TextEditingController password;
  late TextEditingController repassword;
  ResetPasswordData resetPasswordData = ResetPasswordData();
  updatePassword() async {
    if (formstate.currentState!.validate()) {
      if (password.text != repassword.text) {
        return Get.defaultDialog(
            title: "Warning", content: const Text("Password does not match"));
      } else {
        statusRequest = StatusRequest.loading;
        update();
        var response = await resetPasswordData
            .updateData({"email": email, "password": password.text});
        statusRequest = handlingData(response);
        update();
        if (statusRequest == StatusRequest.success) {
          if (response['status'] == "failure") {
            Get.defaultDialog(
                title: "Warning",
                content: const Text(
                    "Something went wrong and Password does not valid"));
            //No Thing To Do
          } else {
            Get.toNamed(AppRoute.successresetpassword);
          }
        }
      }
    }
    update();
  }

  @override
  void onInit() {
    password = TextEditingController();
    repassword = TextEditingController();
    email = Get.arguments['email'];
    // TODO: implement onInit
    super.onInit();
  }
}
