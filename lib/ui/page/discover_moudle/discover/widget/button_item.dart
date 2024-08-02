import 'package:flutter/material.dart';
import 'package:music/theme/widgets/theme_container.dart';
import 'package:music/theme/widgets/theme_text.dart';

class ButtonItem extends StatelessWidget {
  const ButtonItem({
    required this.item,
    super.key,
  });
  final Map<String, dynamic> item;

  @override
  Widget build(BuildContext context) {
    var onTap = item['onTap'];
    var src = item['src'];
    var title = item['title'];
    String? day = item['day'];
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        child: Column(
          children: [
            ///图标
            _buildImg(src, day),

            ///文字
            _buildTitle(title),
          ],
        ),
      ),
    );
  }

  _buildImg(src, day) {
    return Stack(
      children: [
        ThemeContainer(
          width: 60,
          height: 60,
          borderRadius: BorderRadius.circular(30.0),
          child: Image.asset(src),
        ),
        day == null
            ? const SizedBox()
            : Positioned(
                left: 24,
                top: 27,
                child: ThemeText(
                  day,
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
      ],
    );
  }

  _buildTitle(title) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: ThemeText(
        title,
        style: const TextStyle(
          fontSize: 14.0,
        ),
      ),
    );
  }
}
