import 'package:flutter/material.dart';
import 'package:music/widgets/box.dart';
import 'package:music/ui/page/login_moudle/login/controller.dart';
import 'package:music/widgets/text_edit.dart';

class AccountLogin extends StatelessWidget {
  const AccountLogin({
    super.key,
    required this.controller,
  });
  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///账号输入框
        _accountInput(),
        vBox(12),

        ///密码输入框
        _passwordInput(),
      ],
    );
  }

  _accountInput() {
    return TextEditeWidget(
      hintText: '邮箱/手机号',
      controller: controller.accountContro,
    );
  }

  _passwordInput() {
    return TextEditeWidget(
      hintText: '密码',
      controller: controller.passwordContro,
      obscureText: true,
    );
  }
}
