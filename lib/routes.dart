import 'package:first_project/core/constant/routes.dart';
import 'package:first_project/view/screen/auth/login.dart';
import 'package:first_project/view/screen/auth/resetpassword/resetpassword.dart';
import 'package:first_project/view/screen/auth/resetpassword/successresetpassword.dart';
import 'package:first_project/view/screen/auth/signup.dart';
import 'package:first_project/view/screen/auth/resetpassword/verifycoderesetpassword.dart';
import 'package:first_project/view/screen/auth/verifycodesignup.dart';
import 'package:first_project/view/screen/homepage.dart';
import 'package:first_project/view/screen/onboardingscreen.dart';
import 'package:first_project/view/screen/test.dart';
import 'package:first_project/view/test/geolocator.dart';
import 'package:first_project/view/test/notification.dart';
import 'package:get/get.dart';

import 'view/screen/auth/resetpassword/successresetpassword.dart';
import 'core/middleware/mymiddleware.dart';
import 'view/screen/auth/resetpassword/forgetpassword.dart';
import 'view/screen/auth/successsignup.dart';

List<GetPage<dynamic>>? routes = [
  //=======================Test===========================

  GetPage(
    name: AppRoute.test,
    page: () => const Test(),
  ),
  //=======================OnBoarding===========================

  GetPage(
      name: AppRoute.onboarding,
      page: () => const OnBoardingScreen(),
      middlewares: [MyMiddleWare()]),
  //=======================Auth===========================

  GetPage(
    name: AppRoute.login,
    page: () => const Login(),
  ),
  GetPage(
    name: AppRoute.signup,
    page: () => const SignUp(),
  ),
  GetPage(
    name: AppRoute.verifycodesignup,
    page: () => const VerifyCodeSignUp(),
  ),
  GetPage(
    name: AppRoute.successsignup,
    page: () => const SuccessSignUp(),
  ),
  GetPage(
    name: AppRoute.forgetpassword,
    page: () => const ForgetPassword(),
  ),
  GetPage(
    name: AppRoute.resetpassword,
    page: () => const ResetPassword(),
  ),
  GetPage(
    name: AppRoute.verifycoderesetpassword,
    page: () => const VerifyCodeResetPassword(),
  ),
  GetPage(
    name: AppRoute.successresetpassword,
    page: () => const SuccessResetPassword(),
  ),
  //=======================HomePage===========================
  GetPage(
    name: AppRoute.homepage,
    page: () => const HomePage(),
  ),
  //=======================Test===========================
  GetPage(
    name: AppRoute.geolocator,
    page: () => const GeolcatorScreen(),
  ),
  //=======================Notification===========================
  GetPage(
    name: AppRoute.notification,
    page: () => const NotificationScreen(),
  ),
];

// Map<String, Widget Function(BuildContext)> routes1 = {
//   //=======================Test===========================
//   AppRoute.test: (context) => const Test(),
//   //=======================OnBoarding===========================
//   AppRoute.onboarding: (context) => const OnBoardingScreen(),
//   //=======================Auth===========================
//   AppRoute.login: (context) => const Login(),
// };
