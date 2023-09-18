import 'package:first_project/linkapi.dart';
import 'package:get/get.dart';

import '../../../core/class/crud.dart';

class LoginData {
  Crud crud = Get.find();
  getData(Map data) async {
    var response = await crud.postData(ApiLink.login, data);
    return response.fold((l) => l, (r) => r);
  }
}
