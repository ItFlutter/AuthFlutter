import 'package:first_project/core/constant/routes.dart';
import 'package:get/get.dart';

class SuccessResetPasswordController extends GetxController {
  goToPageLogin() {
    Get.offAllNamed(AppRoute.login);
  }
}
