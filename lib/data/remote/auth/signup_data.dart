import 'package:get/get.dart';

import '../../../core/class/crud.dart';
import '../../../linkapi.dart';

class SignUpData {
  Crud crud = Get.find();
  insertData(Map data) async {
    var response = await crud.postData(ApiLink.signup, data);
    return response.fold((l) => l, (r) => r);
  }
}
