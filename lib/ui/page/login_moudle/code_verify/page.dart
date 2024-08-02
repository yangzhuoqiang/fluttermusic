import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music/widgets/box.dart';
import 'package:music/ui/page/login_moudle/code_verify/widget/code_input.dart';
import 'package:music/ui/page/login_moudle/code_verify/widget/verify_function.dart';
import 'package:music/ui/page/login_moudle/login/widget/login_function.dart';

import 'controller.dart';
import 'widget/resend_button.dart';

class CodeVerifyPage extends GetView<CodeVerifyController> {
  const CodeVerifyPage({super.key});

  @override
  Widget build(BuildContext context) {
    ///视频背景
    return videoBg(
      ///整体布局
      child: verifyBg(
        children: [
          ///返回按钮
          backButton(),

          vBox(25),

          ///标题
          verifyTitle(),

          vBox(25),

          ///描述
          verifyDesc(),

          vBox(10),

          ///手机号及重发按钮
          verifyPhoneLayout(
            children: [
              ///手机号
              verifyPhone(phone: controller.phone),

              ///重发按钮
              ResendButton(
                controller: controller,
                onTap: controller.onResend,
              ),
            ],
          ),

          vBox(50),

          ///验证码输入框
          CodeInput(
            onCodeComplete: (code) => controller.onSubmitted(code),
          ),
        ],
      ),
    );
  }
}
