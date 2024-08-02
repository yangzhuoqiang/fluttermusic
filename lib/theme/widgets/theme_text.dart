import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music/theme/theme_controller.dart';

class ThemeText extends GetView<ThemeController> {
  const ThemeText(
    this.text, {
    super.key,
    required this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.direction,
  });
  final String text;
  final TextStyle style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextDirection? direction;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Text(
        text,
        style: style.copyWith(color: controller.fontColor.value),
        textAlign: textAlign,
        overflow: overflow,
        maxLines: maxLines,
        textDirection: direction,
      ),
    );
  }
}
