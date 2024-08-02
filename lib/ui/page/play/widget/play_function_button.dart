import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music/res/r.dart';
import 'package:music/res/style.dart';

import '../play_controller.dart';

class PlayFunctionButtons extends StatelessWidget {
  const PlayFunctionButtons({
    super.key,
    this.onSubscribed,
    this.onDownload,
    this.onBfc,
    this.onComment,
    this.onMore,
  });
  final VoidCallback? onSubscribed;
  final VoidCallback? onDownload;
  final VoidCallback? onBfc;
  final VoidCallback? onComment;
  final VoidCallback? onMore;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ///收藏按钮
          _subscribedButton(onSubscribed),

          ///下载按钮
          _item(
            image: R.images.download,
            onTap: onDownload,
          ),

          ///bfc按钮
          _item(
            image: R.images.bfc,
            onTap: onBfc,
          ),

          ///评论按钮
          _comment(onComment),

          ///更多按钮
          _item(
            image: R.images.more,
            onTap: onMore,
          ),
        ],
      ),
    );
  }
}

_subscribedButton(onSubscribed) {
  return GetBuilder<PlayController>(
    id: 'like',
    builder: (controller) {
      return AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        switchInCurve: Curves.bounceIn,
        transitionBuilder: (child, animation) {
          return ScaleTransition(
            scale: animation,
            child: child,
          );
        },
        child: _item(
          key: ValueKey(controller.isLiked),
          image: controller.isLiked ? R.images.like : R.images.disLike,
          onTap: onSubscribed,
        ),
      );
    },
  );
}

_comment(
  onComment,
) {
  return GetBuilder<PlayController>(
    id: 'commentCount',
    builder: (controller) {
      return Align(
        child: SizedBox(
          width: 50,
          height: 50,
          child: Stack(
            alignment: Alignment.center,
            children: [
              _item(
                image: R.images.comment,
                onTap: onComment,
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Text(
                    controller.commentCount,
                    style: Style.white12,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget _item({
  required String image,
  VoidCallback? onTap,
  ValueKey? key,
}) {
  return GestureDetector(
    key: key,
    onTap: onTap,
    child: Image.asset(
      image,
      width: 50,
      height: 50,
    ),
  );
}
