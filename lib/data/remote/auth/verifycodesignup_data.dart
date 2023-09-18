import 'package:first_project/linkapi.dart';
import 'package:get/get.dart';

import '../../../core/class/crud.dart';

class VerifyCodeSignUpData {
  Crud crud = Get.find();
  getData(Map data) async {
    var response = await crud.postData(ApiLink.verifycodesignup, data);
    return response.fold((l) => l, (r) => r);
  }

  resend(Map data) async {
    var response = await crud.postData(ApiLink.resendverifycode, data);
    return response.fold((l) => l, (r) => r);
  }
}
