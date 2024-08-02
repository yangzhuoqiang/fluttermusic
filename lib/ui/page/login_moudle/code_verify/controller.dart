import 'dart:async';

import 'package:get/get.dart';
import 'package:music/base/controllers/base_get_controller.dart';
import 'package:music/routes/app_routes.dart';
import 'package:music/utils/sp_util.dart';
import 'package:music/utils/toast_util.dart';

class CodeVerifyController extends BaseGetController {
  late String phone;
  final count = 60.obs;
  late Timer timer;

  @override
  void onInit() {
    phone = Get.arguments;
    startTime();
    super.onInit();
  }

  startTime() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (count.value == 0) {
          timer.cancel();
        } else {
          count.value--;
        }
      },
    );
  }

  onResend() {
    if (count.value == 0) {
      count.value = 60;
      repository.sendCode(
        phone: phone,
        success: (data) {
          startTime();
          if (data) {
            ToastUtil.show('发送成功');
          } else {
            ToastUtil.show('发送失败');
          }
        },
        fail: (msg) => ToastUtil.show(msg),
      );
    } else {
      ToastUtil.show('请稍后再试');
    }
  }

  onSubmitted(int code) {
    repository.verifyCode(
      phone: phone,
      captcha: code.toString(),
      success: (data) {
        if (data) {
          repository.captchaLogin(
              phone: phone,
              captcha: code.toString(),
              success: (cookie) {
                SpUtil.cookie = cookie;
                Get.offAllNamed(Routes.index);
              },
              fail: (msg) => ToastUtil.show(msg));
        } else {
          ToastUtil.show('验证码错误');
        }
      },
    );
  }
}
