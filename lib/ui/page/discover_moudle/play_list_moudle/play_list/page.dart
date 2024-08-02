import 'package:flutter/material.dart';

import 'package:music/base/views/get_state_view.dart';
import 'package:music/ui/page/discover_moudle/play_list_moudle/play_list/widget/play_list_function.dart';

import 'controllers/controller.dart';

class PlayListPage extends GetStateView<PlayListController, List<String>> {
  const PlayListPage({super.key});

  @override
  Widget build(context, data) {
    return playListBg(
      tabs: data,
      tabController: controller.tabController,
      body: bodyLayout(
        tabController: controller.tabController,
        children: controller.pages,
      ),
    );
  }
}
