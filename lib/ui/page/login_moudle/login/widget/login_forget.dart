import 'package:flutter/material.dart';
import 'package:music/ui/page/login_moudle/login/controller.dart';

import '../../../../../res/style.dart';

class LoginForget extends StatelessWidget {
  const LoginForget({
    super.key,
    required this.onTap,
    required this.controller,
  });
  final VoidCallback onTap;
  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    ///如果是手机号登陆的话需要影藏起来
    return controller.isPhone.value
        ? const SizedBox()
        : GestureDetector(
            onTap: onTap,
            child: Text(
              '忘记密码',
              style: Style.puhui15grey,
            ),
          );
  }
}
