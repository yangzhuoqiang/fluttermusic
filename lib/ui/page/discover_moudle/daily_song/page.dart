import 'package:flutter/material.dart';
import 'package:music/base/views/get_state_view.dart';
import 'package:music/models/play_list_detail_song_entity.dart';
import 'package:music/res/r.dart';
import 'package:music/theme/widgets/theme_text.dart';
import 'package:music/ui/page/discover_moudle/daily_song/controller.dart';
import 'package:music/ui/page/discover_moudle/daily_song/widget/daily_content.dart';
import 'package:music/ui/page/discover_moudle/daily_song/widget/daily_function.dart';
import 'package:music/widgets/blur_image.dart';
import 'package:music/widgets/custom_appbar.dart';
import 'package:music/widgets/song_item/image_song_item.dart';
import 'package:music/widgets/strick.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../../../utils/date_util.dart';
import '../../../../widgets/custom_list/build_list.dart';

class DailySongsPage
    extends GetStateView<DailySongsController, List<PlayListDetailSongEntity>> {
  const DailySongsPage({super.key});

  @override
  Widget build(BuildContext context, data) {
    return dailyBg(
      children: [
        ///appbar
        CustomAppBar(
          ///头部内容
          content: headerContentLayout(
            children: [
              ///自适应
              const Spacer(),

              ///日期显示
              DailyContent(
                ///天数
                dd: '${DateUtil.formatDate(DateTime.now(), format: 'dd')} ',

                ///月数
                mm: '/ ${DateUtil.formatDate(DateTime.now(), format: 'MM')}',
              ),

              ///文字
              headerContentTitle(),
            ],
          ),

          ///头部背景模糊图片
          background: BlurImage(blur: 100, url: R.images.dailyBg),

          ///头部标题
          title: const ThemeText(
            '每日推荐',
            style: TextStyle(fontSize: 18),
          ),
          centerTitle: true,
        ),

        CustomStrick(
          length: data.length,
        ),

        ///列表
        SliverClip(
          child: buildSliverList<PlayListDetailSongEntity>(
            itemBuilder: (item, index) {
              return ImageSongItem(
                name: item.name,
                cover: item.picUrl,
                artist: item.singer + item.des,
                trailing: true,
              );
            },
            items: data,
          ),
        ),
      ],
    );
  }
}
