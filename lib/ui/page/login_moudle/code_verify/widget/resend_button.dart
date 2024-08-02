import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music/res/style.dart';
import 'package:music/ui/page/login_moudle/code_verify/controller.dart';

class ResendButton extends StatelessWidget {
  const ResendButton({
    super.key,
    required this.controller,
    required this.onTap,
  });
  final CodeVerifyController controller;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: onTap,
        child: Text(
          controller.count.value == 0
              ? '重发验证码'
              : '${controller.count.value}s后重发',
          style: Style.grey19,
        ),
      ),
    );
  }
}
