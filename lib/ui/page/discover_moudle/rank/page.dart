import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music/base/views/get_state_view.dart';
import 'package:music/models/rank_entity.dart';
import 'package:music/res/r.dart';
import 'package:music/res/style.dart';
import 'package:music/routes/app_routes.dart';
import 'package:music/theme/widgets/theme_text.dart';
import 'package:music/ui/page/discover_moudle/rank/controller.dart';
import 'package:music/ui/page/discover_moudle/rank/widget/official_item.dart';
import 'package:music/ui/page/discover_moudle/rank/widget/rank_function.dart';
import 'package:music/widgets/border_image.dart';
import 'package:music/widgets/box.dart';
import 'package:music/widgets/custom_list/build_grid.dart';
import 'package:music/widgets/custom_list/build_list.dart';

class RankPage extends GetStateView<RankController, List<RankEntity>> {
  const RankPage({super.key});

  @override
  Widget build(BuildContext context, List<RankEntity> data) {
    ///官方榜
    List<RankEntity> office =
        data.where((element) => element.tracks.isNotEmpty).toList();

    ///其他榜
    List<RankEntity> other =
        data.where((element) => element.tracks.isEmpty).toList();

    ///整体背景
    return rankBg(
      slivers: [
        ///appbar
        rankAppbar(),

        ///官方榜标题
        officialTitle(
          children: [
            ///官方圆形图标
            BorderImage(
              url: R.images.wylogo,
              border: 10,
              width: 20,
            ),

            hBox(10),

            ///文字
            const ThemeText(
              '官方榜',
              style: Style.white20,
            ),
          ],
        ),

        ///官方榜列表
        buildSliverList<RankEntity>(
          ///单项构造器
          itemBuilder: (item, index) {
            ///列表项
            return OfficialItem(entity: item);
          },

          ///数据源
          items: office,

          ///点击事件
          onItemTap: (item, index) => Get.toNamed(
            Routes.playListDetail,
            arguments: item.id,
          ),
        ),

        sliverVBox(20.0),

        ///其他榜标题
        otherTitle(),

        ///其他榜列表
        buildSliverGrid<RankEntity>(
          ///数据源
          items: other,

          ///单项构造器
          itemBuilder: (item, index) {
            return BorderImage(
              url: item.coverImgUrl,
              border: 15,
            );
          },

          ///点击事件
          onTap: (item, index) => Get.toNamed(
            Routes.playListDetail,
            arguments: item.id,
          ),

          childAspectRatio: 0.9,
        ),
      ],
    );
  }
}
