import 'package:music/models/play_list_entity.dart';
import 'package:music/base/controllers/page_controller.dart';
import 'package:music/typedef/function.dart';

class PlayListBodyController extends BasePageController<PlayListEntity> {
  final String cat;

  PlayListBodyController({required this.cat});
  @override
  request(ParamDoubleCallback<List<PlayListEntity>, bool> success, Fail fail) {
    repository.getPlayList(
      cat: cat,
      offset: page,
      success: (data) {
        success(data, data.length < 21);
      },
      fail: fail,
    );
  }
}
