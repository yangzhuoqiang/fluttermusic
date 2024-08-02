import 'package:get/get.dart';

import 'controller.dart';

class DailySongsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DailySongsController>(() => DailySongsController());
  }
}
