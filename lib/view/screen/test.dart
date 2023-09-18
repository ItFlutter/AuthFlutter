import 'package:first_project/core/class/handlingdataview.dart';
import 'package:first_project/core/constant/statusrequest.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(Get.previousRoute);
    // bool check;
    // chechint() async {
    //   check = await checkinternet();
    //   print(check);
    // }

    // chechint();

    // MyServices myServices = Get.find();
    // myServices.sharedPreferences.setString("1", "ali");
    // print(myServices.sharedPreferences.getString("1"));
    return Scaffold(
      body: HandlingDataView(
          statusRequest: StatusRequest.none,
          widget: Center(
            child: Text("Hello World"),
          )),
    );
  }
}
