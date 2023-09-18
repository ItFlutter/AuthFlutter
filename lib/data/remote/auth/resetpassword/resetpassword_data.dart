import 'package:first_project/linkapi.dart';
import 'package:get/get.dart';

import '../../../../core/class/crud.dart';

class ResetPasswordData {
  Crud crud = Get.find();
  getData(Map data) async {
    var response = await crud.postData(ApiLink.forgetpassword, data);

    return response.fold((l) => l, (r) => r);
  }

  updateData(Map data) async {
    var response = await crud.postData(ApiLink.resetpassword, data);

    return response.fold((l) => l, (r) => r);
  }
}
