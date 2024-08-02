import 'package:flutter/material.dart';
import 'package:music/res/style.dart';
import 'package:music/theme/widgets/theme_backbutton.dart';
import 'package:music/theme/widgets/theme_text.dart';
import 'package:music/ui/page/bottom_play/bottom_music_page.dart';

Widget rankBg({required List<Widget> slivers}) {
  return BottomMusicPage(
    child: SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
          child: CustomScrollView(slivers: slivers),
        ),
      ),
    ),
  );
}

SliverAppBar rankAppbar() {
  return const SliverAppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    title: ThemeText(
      '排行榜',
      style: TextStyle(fontSize: 20),
    ),
    centerTitle: true,
    leading: ThemeBackButton(),
  );
}

SliverToBoxAdapter officialTitle({required List<Widget> children}) {
  return SliverToBoxAdapter(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    ),
  );
}

SliverToBoxAdapter otherTitle() {
  return const SliverToBoxAdapter(
    child: ThemeText(
      '其他榜',
      style: Style.white20,
    ),
  );
}
