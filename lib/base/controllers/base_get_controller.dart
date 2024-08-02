import 'package:get/get.dart';
import 'package:music/http/request_repository.dart';

class BaseGetController extends GetxController {
  late RequestRepository repository;

  @override
  void onInit() {
    repository = Get.find();
    super.onInit();
  }
}
