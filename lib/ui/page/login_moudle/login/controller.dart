import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music/base/controllers/base_get_controller.dart';
import 'package:music/res/r.dart';
import 'package:music/utils/sp_util.dart';
import 'package:music/utils/toast_util.dart';
import 'package:video_player/video_player.dart';

import '../../../../routes/app_routes.dart';

class LoginController extends BaseGetController {
  ///手机号
  final phoneContro = TextEditingController();

  ///账号
  final accountContro = TextEditingController();

  ///密码
  final passwordContro = TextEditingController();

  ///视频控制器
  late VideoPlayerController videoController;

  ///登录类型是否为手机
  final isPhone = true.obs;

  @override
  void onInit() {
    super.onInit();
    videoController = VideoPlayerController.asset(R.videos.loginVideo)
      ..initialize().then((_) {
        videoController.setLooping(true);
        videoController.play();
        update();
      });
  }

  login() {
    ///先判断类型
    if (isPhone.value) {
      ///手机号登录
      ///判空
      var phone = phoneContro.text.trim();
      if (phone.isEmpty || phone.length != 11) {
        ToastUtil.show("请输入正确的手机号");
        return;
      }
      repository.sendCode(
        phone: phone,
        success: (data) {
          if (data) {
            Get.toNamed(
              Routes.codeVerify,
              arguments: phone,
            );
            phoneContro.clear();
          }
        },
        fail: (msg) {
          ToastUtil.show(msg);
        },
      );
    } else {
      ///账号登录
      var account = accountContro.text.trim();
      var password = passwordContro.text.trim();
      if (account.isEmpty || password.isEmpty) {
        ToastUtil.show("请输入账号或密码");
        return;
      }
      if (account.endsWith('@163.com')) {
        repository.emailLogin(
          email: account,
          password: password,
          success: (data) {
            intentPage(data);
          },
          fail: (msg) {
            ToastUtil.show(msg);
          },
        );
      } else {
        ///手机登录
        repository.phoneLogin(
          phone: account,
          password: password,
          success: (data) {
            intentPage(data);
          },
          fail: (msg) {
            ToastUtil.show(msg);
          },
        );
      }
    }
  }

  void intentPage(String cookie) {
    SpUtil.cookie = cookie;
    ToastUtil.show('登录成功');
    Get.offAllNamed(Routes.index);
  }
}
