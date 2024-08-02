import 'package:music/base/controllers/get_state_controller.dart';
import 'package:music/models/rank_entity.dart';
import 'package:music/typedef/function.dart';

class RankController extends GetStateController<List<RankEntity>> {
  @override
  void request(ParamCallback<List<RankEntity>> success, Fail? fail) {
    repository.getRank(
      success: success,
      fail: fail,
    );
  }
}
