import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_project/core/constant/routes.dart';
import 'package:first_project/core/constant/statusrequest.dart';
import 'package:first_project/core/function/handlingdata.dart';
import 'package:first_project/core/services/services.dart';
import 'package:first_project/data/remote/auth/login_data.dart';
import 'package:first_project/data/remote/auth/signup_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignUpController extends GetxController {
  bool appear = true;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController name;
  late TextEditingController phone;
  StatusRequest statusRequest = StatusRequest.none;
  showHidePassword() {
    appear = !appear;
    update();
  }

  goToPageLogIn() {
    Get.offNamed(AppRoute.login);
  }

  Future signInWithGoogle() async {
    statusRequest = StatusRequest.loading;
    update();
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    print(
        "========================googleUser======================${googleUser}");
    if (googleUser == null) {
      statusRequest = StatusRequest.none;
      update();
      return;
    }

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser.authentication;
    print(
        "======================googleAuth========================${googleAuth}");

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    print(
        "=========================credential=====================${credential}");

    // Once signed in, return the UserCredential
    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      myServices.sharedPreferences.setString("idlogin", "1");

      Get.offNamed(AppRoute.homepage);
      print("=========================try=====================");
    } catch (e) {
      statusRequest = StatusRequest.none;
      update();
      print("=========================catch=====================");
    }
  }

  MyServices myServices = Get.find();
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
