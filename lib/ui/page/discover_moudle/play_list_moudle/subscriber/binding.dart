import 'package:get/get.dart';

import 'controller.dart';

class SubscriberBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SubscriberController>(() => SubscriberController());
  }
}
