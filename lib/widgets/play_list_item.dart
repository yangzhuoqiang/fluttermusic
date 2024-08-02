import 'package:flutter/material.dart';
import 'package:music/res/style.dart';
import 'package:music/theme/widgets/theme_text.dart';
import 'package:music/widgets/border_image.dart';

class PlayListItem extends StatelessWidget {
  const PlayListItem({
    super.key,
    required this.title,
    required this.cover,
    this.playCount,
  });
  final String title;
  final String cover;
  final int? playCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      height: 140,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///图片
          _cover(),

          ///标题
          _title(),
        ],
      ),
    );
  }

  _cover() {
    return BorderImage(
      url: cover,
      border: 10,
      playCount: playCount,
      width: 140,
      fit: BoxFit.fitWidth,
    );
  }

  _title() {
    return Expanded(
      child: ThemeText(
        title,
        style: Style.f3f3f316,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
