import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music/base/controllers/get_state_controller.dart';
import 'package:music/models/play_list_detail_song_entity.dart';
import 'package:music/typedef/function.dart';

class DailySongsController
    extends GetStateController<List<PlayListDetailSongEntity>> {
  final scroller = ScrollController();
  final offset = 0.0.obs;

  @override
  void onInit() {
    scroller.addListener(() {
      offset.value = scroller.offset;
    });
    super.onInit();
  }

  @override
  void request(
      ParamCallback<List<PlayListDetailSongEntity>> success, Fail? fail) {
    repository.getDailySongs(
      success: success,
      fail: fail,
    );
  }
}
