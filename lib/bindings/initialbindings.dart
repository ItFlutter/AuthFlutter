import 'package:first_project/core/class/crud.dart';
import 'package:get/get.dart';

import '../core/function/fcmconfig.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() async {
    print("======================================================");
    print("====================Bindings==================================");
    onClickNotificationBackground();
    // onClickNotificationTerminated();

    Get.put(Crud());
    // await Get.putAsync(() => MyServices().initial());

    // TODO: implement dependencies
  }
}
