import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music/res/r.dart';
import 'package:music/ui/page/discover_moudle/discover/page.dart';
import 'package:music/ui/page/event/page.dart';
import 'package:music/ui/page/mine/page.dart';
import 'package:music/ui/page/setting/page.dart';
import 'package:music/ui/page/video/page.dart';

class IndexController extends GetxController {
  ///选中的索引
  final pageSelect = 0.obs;

  ///页面控制器
  final pageController = PageController();

  ///页面列表
  final pageList = <Widget>[
    const DiscoverPage(),
    const VideoPage(),
    const MinePage(),
    const EventPage(),
    const SettingPage(),
  ];

  ///底部图片和标题列表
  final items = <Map<String, String>>[
    {
      'image': R.images.btmDiscovery,
      'imagePrs': R.images.btmDiscoveryPrs,
      'title': '发现',
    },
    {
      'image': R.images.btmVideo,
      'imagePrs': R.images.btmVideoPrs,
      'title': '播客',
    },
    {
      'image': R.images.btmMine,
      'imagePrs': R.images.btmMinePrs,
      'title': '我的',
    },
    {
      'image': R.images.btmEvent,
      'imagePrs': R.images.btmEventPrs,
      'title': '动态',
    },
    {
      'image': R.images.btmAccount,
      'imagePrs': R.images.btmAccountPrs,
      'title': '设置',
    }
  ];

  ///导航栏点击事件
  onItemTap(int index) {
    pageSelect.value = index;
    pageController.jumpToPage(index);
  }
}
