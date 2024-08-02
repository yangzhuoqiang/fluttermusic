import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music/models/play_list_entity.dart';
import 'package:music/refresh/refresh_widget.dart';
import 'package:music/routes/app_routes.dart';
import 'package:music/ui/page/discover_moudle/play_list_moudle/play_list/controllers/body_controller.dart';
import 'package:music/widgets/custom_list/build_grid.dart';
import 'package:music/widgets/play_list_item.dart';

class PlayListBodyPage extends StatelessWidget {
  const PlayListBodyPage({
    super.key,
    required this.cat,
  });
  final String cat;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlayListBodyController>(
      tag: cat,
      builder: (controller) {
        return RefreshWidge<PlayListBodyController>(
          enablePullDown: false,
          tag: cat,
          child: buildGrid<PlayListEntity>(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            items: controller.data,
            itemBuilder: (item, index) {
              return PlayListItem(
                title: item.name,
                cover: item.coverImgUrl,
              );
            },
            onTap: (item, index) =>
                Get.toNamed(Routes.playListDetail, arguments: item.id),
          ),
        );
      },
    );
  }
}
