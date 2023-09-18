import 'package:first_project/core/class/crud.dart';
import 'package:get/get.dart';

import '../core/services/services.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() async {
    print("======================================================");
    print("====================Bindings==================================");
    Get.put(Crud());
    // await Get.putAsync(() => MyServices().initial());

    // TODO: implement dependencies
  }
}
