import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;
  Future<MyServices> initial() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}

initialServices() async {
  print("======================================================");
  print(
      "====================initialServices==================================");
  await Firebase.initializeApp();
  await Get.putAsync(() => MyServices().initial());
}
