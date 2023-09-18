import 'package:first_project/core/constant/routes.dart';
import 'package:first_project/data/static/onboarding_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../core/services/services.dart';

class OnboardingController extends GetxController {
  MyServices myServices = Get.find();
  int currentPage = 0;
  refreshCurrentPage(int index) {
    currentPage = index;
    update();
  }

  next() {
    if (currentPage == onboardingList.length - 1) {
      Get.offAllNamed(AppRoute.login);
      myServices.sharedPreferences.setString("id", "1");
    } else {
      pageController.animateToPage(currentPage + 1,
          duration: const Duration(milliseconds: 600), curve: Curves.easeIn);
    }
  }

  back() {
    pageController.animateToPage(currentPage - 1,
        duration: const Duration(milliseconds: 600), curve: Curves.easeIn);
  }

  goToPageLogin() {
    Get.offAllNamed(AppRoute.login);
    myServices.sharedPreferences.setString("id", "1");
  }

  late PageController pageController;
  @override
  void onInit() {
    pageController = PageController();
    // TODO: implement onInit
    super.onInit();
  }
}
