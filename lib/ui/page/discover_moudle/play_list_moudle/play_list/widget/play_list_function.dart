import 'package:flutter/material.dart';
import 'package:music/theme/widgets/theme_adapter.dart';
import 'package:music/theme/widgets/theme_text.dart';
import 'package:music/ui/page/bottom_play/bottom_music_page.dart';

Widget playListBg({
  required List<String> tabs,
  required TabController tabController,
  required Widget body,
}) {
  return BottomMusicPage(
    child: SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const ThemeText(
            '歌单广场',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          leading: ThemeAdapter(
            builder: (controller) {
              return BackButton(
                color: controller.fontColor.value,
              );
            },
          ),
          bottom: TabBar(
            controller: tabController,
            isScrollable: true,
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white.withOpacity(0.5),
            tabs: tabs.map((e) => Tab(text: e)).toList(),
          ),
        ),
        body: body,
      ),
    ),
  );
}

Widget bodyLayout({
  required TabController tabController,
  required List<Widget> children,
}) {
  return TabBarView(
    controller: tabController,
    children: children,
  );
}
