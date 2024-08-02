import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music/theme/theme_controller.dart';

class ThemeBackButton extends GetView<ThemeController> {
  const ThemeBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => BackButton(
          color: controller.fontColor.value,
        ));
  }
}
