import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:music/res/style.dart';
import 'package:music/utils/string_util.dart';

class BorderImage extends StatelessWidget {
  const BorderImage({
    super.key,
    required this.url,
    required this.border,
    this.fit,
    this.playCount,
    this.width,
    this.alignment,
  });
  final String url;
  final double border;
  final BoxFit? fit;
  final int? playCount;
  final double? width;
  final AlignmentGeometry? alignment;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ///图片
        _backImg(),

        ///是否显示播放次数
        playCount == null ? Container() : float(),
      ],
    );
  }

  _backImg() {
    return Align(
      alignment: alignment ?? Alignment.center,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(border),
        child: url.startsWith('http')
            ? CachedNetworkImage(
                imageUrl: url,
                fit: fit,
                width: width,
              )
            : Image.asset(
                url,
                fit: fit,
                width: width,
              ),
      ),
    );
  }

  float() {
    return Positioned(
      top: 2,
      right: 5,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Container(
          color: Colors.black.withOpacity(0.5),
          child: Row(
            children: [
              const Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 14,
              ),
              Text(
                StringUtil.formatCount(playCount!),
                style: Style.white12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
