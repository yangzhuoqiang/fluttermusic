import 'package:flutter/material.dart';
import 'package:music/res/r.dart';
import 'package:music/theme/widgets/theme_background.dart';

import 'package:music/ui/page/index/controller.dart';

Widget indexBg({required List<Widget> children}) {
  return ThemeBackground(
    child: Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: children,
      ),
    ),
  );
}

Widget indexPageView({required IndexController controller}) {
  return PageView.builder(
    itemBuilder: (ctx, index) {
      return controller.pageList[index];
    },
    itemCount: controller.pageList.length,
    controller: controller.pageController,
    physics: const NeverScrollableScrollPhysics(),
  );
}

Widget bottomLayout({
  required List<Map<String, String>> items,
  required Widget Function(Map<String, String> item, int index) itembuilder,
}) {
  return Positioned(
    bottom: 0,
    left: 0,
    right: 0,
    child: Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              R.images.btmBg,
            ),
            fit: BoxFit.fitWidth),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          items.length,
          (index) => itembuilder(items[index], index),
        ),
      ),
    ),
  );
}
