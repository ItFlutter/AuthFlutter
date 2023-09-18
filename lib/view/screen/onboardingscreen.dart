import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/onboarding_controller.dart';
import '../../core/constant/colors.dart';
import '../../data/static/onboarding_data.dart';
import '../widget/onboarding/custombottomnavigationbar.dart';
import '../widget/onboarding/custombuttonappbar.dart';
import '../widget/onboarding/customdotpageview.dart';
import '../widget/onboarding/imageslideronbaording.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnboardingController());
    return Scaffold(
        bottomNavigationBar: GetBuilder<OnboardingController>(
          builder: (controller) => CustomBottomNavigationBar(
            buttonText1: "back",
            buttonText2: controller.currentPage == onboardingList.length - 1
                ? "Get Started"
                : "Next",
            isFirstPage: controller.currentPage == 0 ? true : false,
            onPressedButton1: () {
              controller.back();
            },
            onPressedButton2: () {
              controller.next();
            },
          ),
        ),
        body: GetBuilder<OnboardingController>(
          builder: ((controller) => Column(
                children: [
                  CustomButtonAppBar(
                    title: "Skip",
                    onPressed: () {
                      controller.goToPageLogin();
                    },
                  ),
                  const Expanded(child: ImageSliderOnBaording()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...List.generate(
                        onboardingList.length,
                        (index) => CustomDotPageView(
                          index: index,
                        ),
                      ),
                    ],
                  )
                ],
              )),
        ));
  }
}
