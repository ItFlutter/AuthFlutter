import 'dart:async';

import 'package:first_project/core/constant/routes.dart';
import 'package:first_project/core/function/handlingdata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/statusrequest.dart';
import '../../../data/remote/auth/resetpassword/verifycoderesetpassword_data.dart';

class VerifyCodeResetPasswordController extends GetxController {
  RxInt counter = 60.obs;
  Timer? timer;
  waiting() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (counter.value == 0) {
        counter.value = 60;
        timer.cancel();
        return;
      }
      counter--;
    });
  }

  String? verifyCode;
  late String email;
  StatusRequest statusRequest = StatusRequest.none;
  VerifyCodeResetPasswordData verifyCodeResetPasswordData =
      VerifyCodeResetPasswordData();

  check() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodeResetPasswordData
        .getData({"email": email, "verifycode": verifyCode});
    statusRequest = handlingData(response);
    update();
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "failure") {
        return Get.defaultDialog(
            title: "Warning", content: const Text("The VerifyCode Not Valid"));
      } else {
        Get.toNamed(AppRoute.resetpassword, arguments: {"email": email});
      }
    }
  }

  resend() async {
    // statusRequest = StatusRequest.loading;
    // update();
    var response = await verifyCodeResetPasswordData.resend({"email": email});
    print(
        "=======================Response Controller===========================$response");

    // statusRequest = handlingData(response);
    // if(statusRequest==StatusRequest.success){
    //   if(response['status']=="success"){

    //   }else{

    //   }
    // }
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    // TODO: implement onInit
    super.onInit();
  }
}
