import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music/base/controllers/get_state_controller.dart';
import 'package:music/typedef/function.dart';
import 'package:music/ui/page/discover_moudle/play_list_moudle/play_list/controllers/body_controller.dart';
import 'package:music/ui/page/discover_moudle/play_list_moudle/play_list/widget/body_page.dart';

class PlayListController extends GetStateController<List<String>>
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  List<Widget> pages = [];

  @override
  void request(ParamCallback<List<String>> success, Fail? fail) {
    repository.getPlayListCatList(
      success: (data) {
        tabController = TabController(length: data.length, vsync: this);
        for (var item in data) {
          Get.lazyPut(
            () => PlayListBodyController(cat: item),
            tag: item,
            fenix: true,
          );
          var page = PlayListBodyPage(cat: item);
          pages.add(page);
        }
        success(data);
      },
      fail: fail,
    );
  }
}
