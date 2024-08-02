import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:music/base/controllers/get_state_controller.dart';
import 'package:music/models/play_list_detail_song_entity.dart';
import 'package:music/routes/app_routes.dart';
import 'package:music/typedef/function.dart';

import '../../../../../base/controllers/play_music_controller.dart';
import '../../../../../models/play_entity.dart';

class PlayListDetailController
    extends GetStateController<Map<String, dynamic>> {
  ///歌单id
  int id = Get.arguments;

  ///滚动控制器
  final scrollController = ScrollController();

  ///滚动偏移量
  final offset = 0.0.obs;

  ///是否为官方歌单
  bool isOfficial = false;

  ///歌曲列表
  List<PlayListDetailSongEntity> songs = [];

  final controller = Get.find<PlayMusicController>();

  @override
  void onInit() {
    scrollController.addListener(() {
      var offset = scrollController.offset;
      this.offset.value = offset;
    });
    super.onInit();
  }

  @override
  void request(ParamCallback<Map<String, dynamic>> success, Fail? fail) {
    repository.getPlayListDetail(
      id: id,
      success: (entity) {
        isOfficial = entity.creator.nickname.contains('官方');
        repository.getPlayListDetailSongs(
          id: id,
          offset: 0,
          limit: entity.trackCount,
          success: (songs) {
            this.songs.addAll(songs);
            repository.getRelatedPlayList(
                id: id,
                success: (related) {
                  success(
                    {
                      'entity': entity,
                      'songs': songs,
                      'related': related,
                    },
                  );
                },
                fail: fail);
          },
          fail: fail,
        );
      },
      fail: fail,
    );
  }

  playOne(PlayListDetailSongEntity item) {
    var song = PlayEntity(
      id: item.id,
      name: item.name,
      cover: item.picUrl,
      singer: item.singer,
    );
    controller.playOne(song);
    Get.toNamed(Routes.play);
  }

  playAll() {
    List<PlayEntity> list = songs.map((e) {
      return PlayEntity(
        id: e.id,
        name: e.name,
        cover: e.picUrl,
        singer: e.singer,
      );
    }).toList();
    controller.playMore(songs: list);
    Get.toNamed(Routes.play);
  }
}
