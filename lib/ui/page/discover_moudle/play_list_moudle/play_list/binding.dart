import 'package:get/get.dart';

import 'controllers/controller.dart';

class PlayListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlayListController>(() => PlayListController());
  }
}
