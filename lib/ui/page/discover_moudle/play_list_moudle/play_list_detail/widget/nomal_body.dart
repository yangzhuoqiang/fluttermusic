import 'package:flutter/material.dart';

import '../../../../../../models/play_list_detail_entity.dart';
import '../../../../../../widgets/box.dart';
import '../../../../../../widgets/border_image.dart';
import 'function.dart';

class NomalBody extends StatelessWidget {
  const NomalBody({
    super.key,
    required this.entity,
    required this.onDescTap,
  });
  final PlayListDetailEntity entity;
  final VoidCallback onDescTap;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      ///顶部整体布局
      child: detailTopHeader(
        children: [
          ///左侧图片
          BorderImage(
            url: '${entity.coverImgUrl}?param=200y200',
            border: 10,
            playCount: entity.playCount,
          ),

          hBox(10),

          ///右侧内容
          detailTopHeaderRight(
            children: [
              ///标题
              detailTitle(title: entity.name),

              ///作者
              detailAuthor(
                avatar: '${entity.creator.avatarUrl}?param=50y50',
                name: entity.creator.nickname,
                onTap: onDescTap,
              ),

              ///描述
              detailDesc(desc: entity.description),
            ],
          ),
        ],
      ),
    );
  }
}
