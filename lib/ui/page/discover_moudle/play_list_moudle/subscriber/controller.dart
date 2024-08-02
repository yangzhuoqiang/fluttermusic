import 'package:get/get.dart';
import 'package:music/models/creator_entity.dart';
import 'package:music/base/controllers/page_controller.dart';
import 'package:music/typedef/function.dart';

class SubscriberController extends BasePageController<CreatorEntity> {
  int id = Get.arguments;
  @override
  request(ParamDoubleCallback<List<CreatorEntity>, bool> success, Fail fail) {
    repository.getPlayListSubscribers(
      id: id,
      offset: page,
      success: (data) => success(data, data.length < 21),
      fail: fail,
    );
  }
}
