import 'package:flutter/material.dart';

import 'custom_app_delegate.dart';

class CustomStrick extends StatelessWidget {
  const CustomStrick({
    super.key,
    this.onTap,
    required this.length,
  });
  final VoidCallback? onTap;

  ///歌曲数量
  final int length;
  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: CustomAppDelegate(
        minHeight: 40,
        maxHeight: 40,
        child: Container(
          color: Colors.transparent,
          child: GestureDetector(
            onTap: onTap,
            child: Row(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.play_arrow_rounded,
                    color: Colors.white,
                  ),
                ),
                RichText(
                  text: TextSpan(
                      text: '播放全部',
                      style: const TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: '($length)',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                          ),
                        )
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
