import 'package:flutter/material.dart';
import 'package:music/widgets/box.dart';
import 'package:music/res/style.dart';
import 'package:music/ui/page/login_moudle/login/controller.dart';
import 'package:music/widgets/text_edit.dart';

class PhoneLogin extends StatelessWidget {
  const PhoneLogin({super.key, required this.controller});
  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///标题地区
        _title(),

        vBox(12.0),

        ///输入框
        _input(),
      ],
    );
  }

  _input() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('+86', style: Style.white20),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: TextEditeWidget(
              controller: controller.phoneContro,
              hintText: '输入手机号',
              isNumber: true,
            ),
          ),
        ),
      ],
    );
  }

  _title() {
    return const Text(
      '国家地区 中国',
      style: Style.white20,
    );
  }
}
