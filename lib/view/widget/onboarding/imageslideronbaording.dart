import 'package:first_project/controller/onboarding_controller.dart';
import 'package:first_project/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../data/static/onboarding_data.dart';

class ImageSliderOnBaording extends GetView<OnboardingController> {
  const ImageSliderOnBaording({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller.pageController,
      onPageChanged: (value) {
        controller.refreshCurrentPage(value);
      },
      children: [
        ...List.generate(
            onboardingList.length,
            ((index) => Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                        height: 170,
                        child: SvgPicture.asset(
                          onboardingList[index].image,
                          fit: BoxFit.contain,
                        )),
                    const SizedBox(
                      height: 60,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            onboardingList[index].title,
                            style: const TextStyle(
                                color: AppColor.primaryColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40.0, vertical: 10),
                            child: Text(
                              onboardingList[index].description,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ))),
      ],
    );
  }
}
