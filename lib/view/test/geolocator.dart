import 'package:first_project/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../controller/test/geolocator-controller.dart';

class GeolcatorScreen extends StatelessWidget {
  const GeolcatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(GeolocatorController());
    return Scaffold(
        appBar: AppBar(
          title: Text("geolocator"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Get.offAllNamed(AppRoute.homepage);
            },
          ),
        ),
        body: GetBuilder<GeolocatorController>(
          builder: ((controller1) => Container(
                child: GoogleMap(
                  myLocationEnabled: true,
                  // tiltGesturesEnabled: false,
                  compassEnabled: true,
                  // scrollGesturesEnabled: true,
                  // zoomGesturesEnabled: true,
                  mapType: MapType.normal,
                  markers: controller1.myMarker,
                  initialCameraPosition: controller1.cameraPosition,
                  polylines: Set<Polyline>.of(controller1.polylines.values),
                  onMapCreated: (GoogleMapController controller) {
                    controller1.controllerCamera = controller;
                  },
                  onTap: (LatLng latLng) async {
                    List<Placemark> placemarks = await placemarkFromCoordinates(
                        latLng.latitude, latLng.longitude);

                    print("==========================================");
                    print(
                        "=======================administrativeArea===================${placemarks[0].administrativeArea}");
                    print(
                        "=========================country=================${placemarks[0].country}");
                    print(
                        "==========================isoCountryCode================${placemarks[0].isoCountryCode}");
                    print(
                        "=============================locality=============${placemarks[0].locality}");
                    print(
                        "=============================name=============${placemarks[0].name}");
                    print(
                        "=========================postalCode=================${placemarks[0].postalCode}");
                    print(
                        "===========================street===============${placemarks[0].street}");
                    print(
                        "=========================subAdministrativeArea=================${placemarks[0].subAdministrativeArea}");
                    print(
                        "====================subLocality======================${placemarks[0].subLocality}");
                    print(
                        "=======================subThoroughfare===================${placemarks[0].subThoroughfare}");
                    print(
                        "======================thoroughfare====================${placemarks[0].thoroughfare}");
                    print("==========================================");
                  },
                  // onTap: (LatLng latlng) {
                  //   controller1.setMarker(latlng.latitude, latlng.longitude);
                  // },
                ),
              )),
        ));
  }
}
