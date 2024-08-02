import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music/widgets/box.dart';
import 'package:music/ui/page/login_moudle/login/widget/account_login.dart';
import 'package:music/ui/page/login_moudle/login/widget/login_button.dart';
import 'package:music/ui/page/login_moudle/login/widget/login_forget.dart';
import 'package:music/ui/page/login_moudle/login/widget/login_function.dart';
import 'package:music/ui/page/login_moudle/login/widget/login_type.dart';
import 'package:music/ui/page/login_moudle/login/widget/phoe_login.dart';

import 'controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    ///登录视频背景
    return videoBg(
      ///登录页中间件
      child: loginBox(
        children: [
          ///标题
          loginTitle(controller: controller),

          ///输入区域分为手机登录和账号密码登录
          ///由controller中的变量控制
          loginInptuArea(
            children: [
              ///手机号登录先不管我们先搞登录按钮和尾部布局
              Obx(() {
                return controller.isPhone.value
                    ? PhoneLogin(controller: controller)
                    : AccountLogin(controller: controller);
              }),

              vBox(28),

              ///登录按钮
              LoginButton(
                onTap: controller.login,
              ),

              vBox(15),

              ///登录方式切换布局
              loginTypeLayout(
                children: [
                  ///切换按钮
                  LoginType(
                    controller: controller,
                    onTap: () =>
                        controller.isPhone.value = !controller.isPhone.value,
                  ),

                  ///忘记密码按钮
                  LoginForget(
                    onTap: () {},
                    controller: controller,
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
