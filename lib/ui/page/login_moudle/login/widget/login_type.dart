import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music/res/style.dart';
import 'package:music/ui/page/login_moudle/login/controller.dart';

class LoginType extends StatelessWidget {
  const LoginType({
    super.key,
    required this.controller,
    required this.onTap,
  });
  final LoginController controller;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Obx(
        () => Text(
          controller.isPhone.value ? '账号密码登录' : '手机验证码登录',
          style: Style.puhui15white,
        ),
      ),
    );
  }
}
