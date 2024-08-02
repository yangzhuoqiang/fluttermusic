import 'package:flutter/material.dart';
import 'package:music/theme/widgets/theme_background.dart';
import 'package:music/ui/page/bottom_play/page.dart';

///底部有悬浮播放器页面统一布局
class BottomMusicPage extends StatelessWidget {
  const BottomMusicPage({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ThemeBackground(
      child: Stack(
        children: [
          ///页面
          child,

          ///悬浮播放
          bottomPlayPage(bottom: 0),
        ],
      ),
    );
  }
}
