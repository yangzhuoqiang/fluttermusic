import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:music/base/views/get_common_view.dart';
import 'package:music/models/creator_entity.dart';
import 'package:music/refresh/refresh_widget.dart';
import 'package:music/res/color_style.dart';
import 'package:music/theme/widgets/theme_text.dart';
import 'package:music/ui/page/bottom_play/bottom_music_page.dart';
import 'package:music/widgets/custom_list/build_list.dart';
import 'package:music/widgets/custom_list_title.dart';

import 'controller.dart';

class SubscriberPage extends GetCommonView<SubscriberController> {
  const SubscriberPage({super.key});

  @override
  Widget buildWidget(BuildContext context) {
    return BottomMusicPage(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          title: const ThemeText(
            '收藏者',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          leading: const BackButton(
            color: Colors.white,
          ),
          backgroundColor: ColorStyle.X6D8EE9.withOpacity(0.8),
        ),
        body: RefreshWidge<SubscriberController>(
          enablePullDown: false,
          child: buildList<CreatorEntity>(
            itemBuilder: (item, index) {
              return CustomListTitle(
                leading: CircleAvatar(
                  radius: 25,
                  backgroundImage: CachedNetworkImageProvider(
                    item.avatarUrl,
                  ),
                ),
                title: item.nickname,
                subtitle: item.signature,
                padding: const EdgeInsets.symmetric(horizontal: 16),
              );
            },
            items: controller.data,
          ),
        ),
      ),
    );
  }
}
