// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:get/get.dart';

// checkPermission() async {
//   double? latitude;
//   double? longitude;
//   bool locationService = await Geolocator.isLocationServiceEnabled();
//   print("====================================================================");
//   print(
//       "================================LocationService====================================$locationService");
//   if (!locationService) {
//     await Get.defaultDialog(
//         title: "Warning",
//         middleText: "Please Turn On Location Service OR App Not Work Correctly",
//         confirm: TextButton(
//             onPressed: () async {
//               await Geolocator.openLocationSettings();
//             },
//             child: Text("Turn On")),
//         cancel: TextButton(
//             onPressed: () {
//               Get.back();
//             },
//             child: Text("Ignore")));
//   }
//   locationService = await Geolocator.isLocationServiceEnabled();
//   print("====================================================================");
//   print(
//       "================================LocationService====================================$locationService");
//   if (locationService) {
//     LocationPermission? locationPermission;

//     locationPermission = await Geolocator.checkPermission();
//     print(
//         "====================================================================");
//     print(
//         "================================LocationPermission1====================================$locationPermission");
//     if (locationPermission == LocationPermission.denied) {
//       print(
//           "====================================================================");
//       print(
//           "================================LocationPermission2====================================$locationPermission");
//       locationPermission = await Geolocator.requestPermission();
//       print(
//           "====================================================================");
//       print(
//           "================================LocationPermission3====================================$locationPermission");
//       if (locationPermission == LocationPermission.denied) {
//         return Get.defaultDialog(
//             title: "Error",
//             middleText: "Please Give The App Permission OR Not Work Correctly");
//       }
//       if (locationPermission == LocationPermission.deniedForever) {
//         return Get.defaultDialog(
//             title: "Error",
//             middleText:
//                 "You Not Give The App Permission So Not Work Correctly");
//       }
//     }
//     Position position = await Geolocator.getCurrentPosition();
//     latitude = position.latitude;
//     longitude = position.longitude;
//     return true;
//     // print("============================================");
//     // print("======================position======================${position}");

//     // double distanceInMeters = Geolocator.distanceBetween(
//     //     52.2165157, 6.9437819, 52.3546274, 4.8285838);
//     // print("================================");
//     // print(distanceInMeters / 1000);
//     // print("================================");
//     //GetCurrentLocation
//   }
// }
