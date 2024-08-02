import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:get/get.dart';
import 'package:music/widgets/border_image.dart';

import '../controller.dart';

class DiscoverBanner extends StatelessWidget {
  const DiscoverBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: GetBuilder<DiscoverController>(
        builder: (controller) {
          return Container(
            padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
            height: 150,
            child: Swiper(
              itemBuilder: (ctx, index) {
                return BorderImage(
                  url: controller.banners[index],
                  border: 15,
                );
              },
              itemCount: controller.banners.length,
              pagination:
                  const SwiperPagination(alignment: Alignment.bottomCenter),
              controller: SwiperController(),
              autoplay: true,
            ),
          );
        },
      ),
    );
  }
}
