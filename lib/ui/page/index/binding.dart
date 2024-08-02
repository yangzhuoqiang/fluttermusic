import 'package:get/get.dart';
import 'package:music/ui/page/discover_moudle/discover/controller.dart';
import 'package:music/ui/page/event/controller.dart';
import 'package:music/ui/page/mine/controller.dart';
import 'package:music/ui/page/video/controller.dart';

import 'controller.dart';

class IndexBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IndexController>(() => IndexController());
    Get.lazyPut<VideoController>(() => VideoController());
    Get.lazyPut<MineController>(() => MineController());
    Get.lazyPut<DiscoverController>(() => DiscoverController());
    Get.lazyPut<EventController>(() => EventController());
  }
}
