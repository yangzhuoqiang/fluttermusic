import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music/ui/page/index/widget/bottom_item.dart';
import 'package:music/ui/page/index/widget/index_function.dart';
import 'package:music/widgets/box.dart';

import '../bottom_play/page.dart';
import 'controller.dart';

class IndexPage extends GetView<IndexController> {
  const IndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return indexBg(
      children: [
        ///滚动页面
        indexPageView(controller: controller),

        ///悬浮播放
        bottomPlayPage(
          ///底部距离
          bottom: 50,
        ),

        ///底部导航栏
        bottomLayout(
          ///底部导航栏数据
          items: controller.items,

          ///底部导航栏item构造器
          itembuilder: (item, index) {
            return BottomItem(
              index: index,
              controller: controller,

              ///底部导航栏item点击事件
              onTap: () => controller.onItemTap(index),

              ///底部导航栏item数据
              item: item,
            );
          },
        ),
      ],
    );
  }
}
