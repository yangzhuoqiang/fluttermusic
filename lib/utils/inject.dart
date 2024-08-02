import 'package:get/get.dart';
import 'package:music/base/controllers/play_music_controller.dart';
import 'package:music/http/request_repository.dart';
import 'package:music/theme/theme_controller.dart';

class Inject {
  static void init() {
    Get.put<RequestRepository>(RequestRepository());
    Get.lazyPut<ThemeController>(() => ThemeController());
    Get.lazyPut<PlayMusicController>(() => PlayMusicController());
  }
}
