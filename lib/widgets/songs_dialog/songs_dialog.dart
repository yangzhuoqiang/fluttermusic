import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music/base/controllers/play_music_controller.dart';
import 'package:music/models/play_entity.dart';
import 'package:music/res/my_icon.dart';
import 'package:music/res/style.dart';
import 'package:music/theme/widgets/theme_background.dart';
import 'package:music/theme/widgets/theme_text.dart';
import 'package:music/widgets/box.dart';
import 'package:music/widgets/custom_list/build_list.dart';
import 'package:music/widgets/songs_dialog/item.dart';

class SongsDialog extends StatelessWidget {
  const SongsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PlayMusicController>();
    return Container(
      width: double.infinity,
      height: 400,
      margin: const EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: ThemeBackground(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///标题文字
                _title(controller.songs.length),

                vBox(20),

                ///图标
                _icon(),

                vBox(15),

                ///列表
                Expanded(
                  child: buildList<PlayEntity>(
                    ///列表构造器
                    itemBuilder: (item, index) {
                      ///列表项
                      return SongDialogItem(
                        ///实体数据
                        entity: item,

                        ///位置索引
                        index: index,

                        ///控制器
                        controller: controller,
                      );
                    },

                    ///数据
                    items: controller.songs,

                    ///点击事件
                    onItemTap: (item, index) => controller.playOne(item),

                    separatorBuilder: (item, index) => vBox(10),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _title(length) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const ThemeText(
          '当前播放',
          style: Style.white18,
        ),
        Text(
          '($length)',
          style: Style.b8c0d414,
        ),
      ],
    );
  }
}

_icon() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: const [
      Icon(
        MyIcons.loop,
        color: Colors.white,
        size: 20,
      ),
      ThemeText('列表循环', style: Style.white12),
    ],
  );
}
