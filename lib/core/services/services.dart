import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:first_project/core/function/fcmconfig.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;
  double? latitude;
  double? longitude;
  Future<MyServices> initial() async {
    sharedPreferences = await SharedPreferences.getInstance();
    await checkPermission();
    myrequestPermission();
    fcmForgroundConfig();
    fcmBackgroundAndTerminatedConfig();
    // onClickNotificationBackground();
    // onClickNotificationTerminated();

    return this;
  }

  checkPermission() async {
    bool locationService = await Geolocator.isLocationServiceEnabled();
    print(
        "====================================================================");
    print(
        "================================LocationService====================================$locationService");
    if (!locationService) {
      await Get.defaultDialog(
          title: "Warning",
          middleText:
              "Please Turn On Location Service OR App Not Work Correctly",
          confirm: TextButton(
              onPressed: () async {
                await Geolocator.openLocationSettings();
              },
              child: Text("Turn On")),
          cancel: TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text("Ignore")));
    }
    locationService = await Geolocator.isLocationServiceEnabled();
    print(
        "====================================================================");
    print(
        "================================LocationService====================================$locationService");
    if (locationService) {
      LocationPermission? locationPermission;

      locationPermission = await Geolocator.checkPermission();
      print(
          "====================================================================");
      print(
          "================================LocationPermission1====================================$locationPermission");
      if (locationPermission == LocationPermission.denied) {
        print(
            "====================================================================");
        print(
            "================================LocationPermission2====================================$locationPermission");
        locationPermission = await Geolocator.requestPermission();
        print(
            "====================================================================");
        print(
            "================================LocationPermission3====================================$locationPermission");
        if (locationPermission == LocationPermission.denied) {
          return Get.defaultDialog(
              title: "Error",
              middleText:
                  "Please Give The App Permission OR Not Work Correctly");
        }
        if (locationPermission == LocationPermission.deniedForever) {
          return Get.defaultDialog(
              title: "Error",
              middleText:
                  "You Not Give The App Permission So Not Work Correctly");
        }
      }
      Position position = await Geolocator.getCurrentPosition();
      latitude = position.latitude;
      longitude = position.longitude;
      return true;
      // print("============================================");
      // print("======================position======================${position}");

      // double distanceInMeters = Geolocator.distanceBetween(
      //     52.2165157, 6.9437819, 52.3546274, 4.8285838);
      // print("================================");
      // print(distanceInMeters / 1000);
      // print("================================");
      //GetCurrentLocation
    }
  }
}

initialServices() async {
  print("======================================================");
  print(
      "====================initialServices==================================");
  await Firebase.initializeApp();
  await Get.putAsync(() => MyServices().initial());
  // await MyServices().checkPermission();
}
