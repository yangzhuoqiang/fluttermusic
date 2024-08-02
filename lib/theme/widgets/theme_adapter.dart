import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music/theme/theme_controller.dart';

class ThemeAdapter extends GetView<ThemeController> {
  const ThemeAdapter({
    super.key,
    required this.builder,
  });
  final Widget Function(ThemeController) builder;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return builder(controller);
      },
    );
  }
}
