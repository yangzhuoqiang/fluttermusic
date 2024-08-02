import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music/base/views/get_save_view.dart';
import 'package:music/models/new_song_entity.dart';
import 'package:music/models/recom_play_entity.dart';
import 'package:music/widgets/box.dart';
import 'package:music/routes/app_routes.dart';
import 'package:music/ui/dialog/page_loading.dart';
import 'package:music/ui/page/discover_moudle/discover/widget/banner.dart';
import 'package:music/ui/page/discover_moudle/discover/widget/discover_appbar.dart';
import 'package:music/ui/page/discover_moudle/discover/widget/discover_function.dart';
import 'package:music/widgets/song_item/image_song_item.dart';
import 'package:music/ui/page/discover_moudle/discover/widget/recom_top.dart';
import 'package:music/widgets/custom_list/build_list.dart';
import 'package:music/widgets/play_list_item.dart';

import 'controller.dart';
import 'widget/button_item.dart';

class DiscoverPage extends GetSaveView<DiscoverController> {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DiscoverController>(
      builder: (_) {
        bool loading = controller.banners.isEmpty ||
            controller.recomPlays.isEmpty ||
            controller.newSongs.isEmpty;
        return loading
            ? const PageLoading()

            ///整体背景
            : discoverBg(
                slivers: [
                  ///appbar
                  const DiscoverAppbar(),

                  sliverVBox(20),

                  ///轮播图
                  const DiscoverBanner(),

                  sliverVBox(20),

                  ///按钮
                  buttonsLayout(
                    ///数据
                    items: controller.buttons,

                    ///单项构造器
                    itemBuilder: (item) {
                      return ButtonItem(
                        item: item,
                      );
                    },
                  ),

                  sliverVBox(18),

                  ///推荐歌单顶部
                  RecomTop(
                    title: '推荐歌单',
                    onTap: () => Get.toNamed(Routes.playList),
                  ),

                  sliverVBox(6),

                  ///推荐歌单
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 200,

                      ///列表
                      child: buildList<RecomPlayListEntity>(
                        ///滚动方向
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        itemBuilder: (item, index) {
                          ///歌单item
                          return PlayListItem(
                            title: item.name,
                            cover: item.picUrl,
                            playCount: item.playCount,
                          );
                        },

                        separatorBuilder: (item, index) => hBox(10),

                        ///数据源
                        items: controller.recomPlays,

                        ///推荐歌单点击
                        onItemTap: (item, index) => Get.toNamed(
                            Routes.playListDetail,
                            arguments: item.id),
                      ),
                    ),
                  ),

                  ///推荐歌曲
                  const RecomTop(title: '推荐歌曲'),

                  SliverToBoxAdapter(
                    child: vBox(6),
                  ),

                  ///推荐歌曲列表
                  buildSliverList<NewSongEntity>(
                    itemBuilder: (item, index) {
                      return ImageSongItem(
                        cover: item.picUrl,
                        name: item.name,
                        artist: item.artistName,
                      );
                    },
                    items: controller.newSongs,
                  ),

                  ///留空
                  sliverVBox(150),
                ],
              );
      },
    );
  }
}
