import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:first_project/core/constant/routes.dart';
import 'package:first_project/core/services/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:github_sign_in/github_sign_in.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePageController extends GetxController {
  MyServices myServices = Get.find();
  signOutWithGoogle() async {
    await GoogleSignIn().signOut();
  }

  signOutWithFacebook() async {
    await FacebookAuth.instance.logOut();
  }

  signOutWithGitHub() async {
    await FirebaseAuth.instance.signOut();
  }

  signOut() {
    signOutWithGoogle();
    signOutWithFacebook();
    signOutWithGitHub();
    myServices.sharedPreferences.remove("idlogin");
    Get.offNamed(AppRoute.login);
  }
}
