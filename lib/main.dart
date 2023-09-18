import 'package:first_project/bindings/initialbindings.dart';
import 'package:first_project/core/constant/routes.dart';
import 'package:first_project/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/constant/themedata.dart';
import 'core/services/services.dart';

void main() async {
  print("======================================================");
  print("====================Main==================================");
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: themeData,
      debugShowCheckedModeBanner: false,
      // routes: routes,
      initialBinding: InitialBindings(),
      getPages: routes,
      initialRoute: AppRoute.onboarding,
    );
  }
}
