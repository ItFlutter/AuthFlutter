import 'dart:async';

import 'package:first_project/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GeolocatorController extends GetxController {
  Map<MarkerId, Marker> markers = {};
  PolylinePoints polylinePoints = PolylinePoints();
  String googleAPiKey = "AIzaSyDqLLE19QhjqQI5D_PtFndsUKbkWif8q9I";

  List<LatLng> polylineCoordinates = [];
  Map<PolylineId, Polyline> polylines = {};
  addPolyLine() {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
        width: 1,
        polylineId: id,
        color: Colors.red,
        points: polylineCoordinates);
    polylines[id] = polyline;
    update();
  }

  getPolyline() async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleAPiKey,
      PointLatLng(34.7331092, 36.7347906),
      PointLatLng(34.712496, 36.706889),
      travelMode: TravelMode.driving,
      // wayPoints: [PolylineWayPoint(location: "Sabo, Yaba Lagos Nigeria")]
    );
    // if (result.points.isNotEmpty) {
    // print("=============================================points1");
    // print("=============================================points2");
    // print("=============================================points2");
    // print("=============================================points2");
    // print("=============================================points2");

    // result.points.forEach((PointLatLng point) {
    // print("=============================================points2");
    // print("=============================================points2");
    // print("=============================================points2");
    // print("=============================================points2");
    polylineCoordinates.add(LatLng(34.7331092, 36.7347906));
    polylineCoordinates.add(LatLng(34.712496, 36.706889));
    // polylineCoordinates.add(LatLng(point.latitude, point.longitude));

    // polylineCoordinates.add(LatLng(point.latitude, point.longitude));
    // });
    // }
    addPolyLine();
  }

  double latitude = 0;
  double longitude = 0;
  late double lat1;
  late double long1;
  MyServices myServices = Get.find();
  Set<Marker> myMarker = {};
  late CameraPosition cameraPosition;
  StreamSubscription<Position>? positionStream;
  GoogleMapController? controllerCamera;

  getCurrentLocation() async {
    if (await myServices.checkPermission()) {
      positionStream =
          Geolocator.getPositionStream().listen((Position? position) {
        latitude = position!.latitude;
        longitude = position.longitude;
        print("===================latitude========================${latitude}");

        print(
            "===================longitude========================${longitude}");

        myMarker.add(Marker(
            markerId: MarkerId("1"), position: LatLng(latitude, longitude)));
        controllerCamera!
            .animateCamera(CameraUpdate.newLatLng(LatLng(latitude, longitude)));
        print("===========================================update");
        update();
        print("===========================================update2");
      });
    }
  }

  // setMarker(latitude, longitude) {
  //   myMarker = {
  //     Marker(markerId: MarkerId("1"), position: LatLng(latitude!, longitude!)),
  //     // Marker(
  //     //     markerId: MarkerId("2"),
  //     //     position: LatLng(latitude! + 10, longitude! + 10)),
  //     // Marker(
  //     //     markerId: MarkerId("4"),
  //     //     position: LatLng(latitude! + 20, longitude! + 20)),
  //   };
  //   update();
  // }

  // CameraPosition kGooglePlex = CameraPosition(
  //   target: LatLng(37.42796133580664, -122.085749655962),
  //   zoom: 14.4746,
  // );
  @override
  void onInit() {
    lat1 = myServices.latitude!;
    long1 = myServices.longitude!;
    cameraPosition = CameraPosition(target: LatLng(lat1, long1), zoom: 14);
    getCurrentLocation();
    getPolyline();
    // setMarker(latitude, longitude);
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    positionStream!.cancel();
    print("==============================================positionStreamcancel");
    // TODO: implement onClose
    super.onClose();
  }
}
//34.714712, 36.716144   شارع الحضارة
//34.712496, 36.706889 جامعة البعث