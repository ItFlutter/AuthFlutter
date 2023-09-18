import 'package:first_project/controller/homepage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomePageController controller = Get.put(HomePageController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        //  leading: IconButton(
        //           padding: const EdgeInsets.symmetric(horizontal: 20),
        //           icon: const Icon(
        //             Icons.arrow_back_ios_new,
        //             color: Colors.black,
        //           ),
        //           onPressed: () {
        //             Get.back();
        //           },
        //         )
        actions: [
          IconButton(
              // padding: const EdgeInsets.symmetric(horizontal: 20),

              onPressed: () {
                controller.signOut();
              },
              icon: Icon(
                Icons.exit_to_app,
                color: AppColor.black,
              )),
        ],
      ),
    );
  }
}
