import 'package:get/get.dart';

import 'controller.dart';

class CodeVerifyBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CodeVerifyController>(() => CodeVerifyController());
  }
}
