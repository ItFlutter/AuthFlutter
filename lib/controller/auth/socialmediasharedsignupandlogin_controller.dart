import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:github_sign_in/github_sign_in.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:twitter_login/twitter_login.dart';
import '../../core/constant/routes.dart';
import '../../core/constant/statusrequest.dart';
import '../../core/services/services.dart';

class SocialMediaSharedSignupAndLogin extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();

  signInWithGoogle() async {
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

  signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();
    print(
        "=====================================================================");
    print(
        "=====================================LoginResult================================${loginResult.status}");
    if (loginResult.status == LoginStatus.success) {
      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
      print(
          "=====================================================================");
      print(
          "=====================================facebookAuthCredential================================${facebookAuthCredential}");

      // Once signed in, return the UserCredential
      try {
        statusRequest = StatusRequest.loading;
        update();
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential);
        myServices.sharedPreferences.setString("idlogin", "1");

        statusRequest = StatusRequest.none;
        update();
        print(
            "=====================================================================");
        print(
            "=====================================UserCredential================================${userCredential}");
        Get.offAllNamed(AppRoute.homepage);
      } catch (e) {
        statusRequest = StatusRequest.none;
        update();
        return Get.defaultDialog(
            title: "Alert Catch", content: Text("Something went wrong"));
      }
    } else {
      return Get.defaultDialog(
          title: "Warning", content: Text("Something went wrong"));
    }
  }

  signInWithGitHub(context) async {
    // Create a GitHubSignIn instance
    final GitHubSignIn gitHubSignIn = GitHubSignIn(
        clientId: "56f5ba69476beddfd4ee",
        clientSecret: "36e7989c47d0eaab7a2e6c32aa0c21e15b42d17b",
        redirectUrl:
            'https://firstproject-666e9.firebaseapp.com/__/auth/handler');

    // print(
    //     "=====================================================================");
    // print(
    //     "=====================================GitHubSignIn================================${gitHubSignIn.}");
    statusRequest = StatusRequest.loading;
    update();
    // Trigger the sign-in flow
    final result = await gitHubSignIn.signIn(context);
    print(
        "=====================================================================");
    print(
        "=====================================result================================${result.status}");
    if (result.status == GitHubSignInResultStatus.ok) {
      // Create a credential from the access token
      final githubAuthCredential = GithubAuthProvider.credential(result.token!);
      myServices.sharedPreferences.setString("idlogin", "1");

      print(
          "=====================================================================");
      print(
          "=====================================githubAuthCredential================================${githubAuthCredential}");

      // Once signed in, return the UserCredential
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(githubAuthCredential);
      print(
          "=====================================================================");
      print(
          "=====================================UserCredential================================${userCredential}");
      statusRequest = StatusRequest.none;
      update();
      Get.offAllNamed(AppRoute.homepage);
    } else {
      statusRequest = StatusRequest.none;
      update();
      return Get.defaultDialog(
          title: "Warning", content: Text("Something went wrong"));
    }
  }

  signInWithTwitter() async {
    // Create a TwitterLogin instance
    final twitterLogin = new TwitterLogin(
        apiKey: 'Tf95c9AT4IdEuWlLjRsQLVdWK',
        apiSecretKey: 'aXGxBoixPAq7bSKFXYJ4yAspKZgSn9aKtA0nxDtaCmsXEXIFgd',
        redirectURI:
            'https://firstproject-666e9.firebaseapp.com/__/auth/handler');

    // Trigger the sign-in flow
    final authResult = await twitterLogin.login();
    print(
        "=====================================================================");
    print(
        "=====================================authResult================================${authResult.status}");
    // Create a credential from the access token
    final twitterAuthCredential = TwitterAuthProvider.credential(
      accessToken: authResult.authToken!,
      secret: authResult.authTokenSecret!,
    );
    print(
        "=====================================================================");
    print(
        "=====================================twitterAuthCredential================================${twitterAuthCredential}");
    // Once signed in, return the UserCredential
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(twitterAuthCredential);
      print(
          "=====================================================================");
      print(
          "=====================================UserCredential================================${userCredential}");
    } catch (e) {
      return Get.defaultDialog(
          title: "Alert Catch", content: Text("Something went wrong"));
    }
  }
}
