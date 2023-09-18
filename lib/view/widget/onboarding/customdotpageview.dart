import 'package:first_project/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/constant/colors.dart';

class CustomDotPageView extends GetView<OnboardingController> {
  final int index;
  const CustomDotPageView({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 600),
      margin: const EdgeInsets.only(right: 7, bottom: 40),
      height: 8,
      width: index == controller.currentPage ? 25 : 10,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: index == controller.currentPage
              ? AppColor.primaryColor
              : const Color(0xffD9D9D9)),
    );
  }
}
