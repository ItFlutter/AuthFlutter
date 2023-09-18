import 'package:first_project/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/routes.dart';

class MyMiddleWare extends GetMiddleware {
  MyServices myServices = Get.find();
  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString("idlogin") == "1") {
      return const RouteSettings(name: AppRoute.homepage);
    }
    if (myServices.sharedPreferences.getString("id") == "1") {
      return const RouteSettings(name: AppRoute.login);
    }
  }
}
