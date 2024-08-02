import 'package:get/get.dart';
import 'package:music/base/controllers/base_get_controller.dart';
import 'package:music/models/new_song_entity.dart';
import 'package:music/models/recom_play_entity.dart';
import 'package:music/res/r.dart';
import 'package:music/utils/date_util.dart';

import '../../../../routes/app_routes.dart';

class DiscoverController extends BaseGetController {
  final banners = <String>[];
  final recomPlays = <RecomPlayListEntity>[];
  final newSongs = <NewSongEntity>[];

  ///按钮数据
  final buttons = <Map<String, dynamic>>[
    {
      'src': R.images.iconFm,
      'title': '私人FM',
      'onTap': () {},
      'day': null,
    },
    {
      'src': R.images.iconDaily,
      'title': '每日推荐',
      'onTap': () => Get.toNamed(Routes.dailySongs),
      'day': DateUtil.getTaday(),
    },
    {
      'src': R.images.iconPlaylist,
      'title': '歌单广场',
      'onTap': () => Get.toNamed(Routes.playList),
      'day': null,
    },
    {
      'src': R.images.iconRank,
      'title': '排行榜',
      'onTap': () => Get.toNamed(Routes.rank),
      'day': null,
    },
  ];
  @override
  onInit() {
    super.onInit();
    geData();
  }

  geData() {
    repository.banner(
      success: (data) {
        banners.addAll(data);
        update();
      },
    );
    repository.getRecomPlays(
      success: (data) {
        recomPlays.addAll(data);
        update();
      },
    );
    repository.getNewSongs(
      success: (data) {
        newSongs.addAll(data);
        update();
      },
    );
  }
}
