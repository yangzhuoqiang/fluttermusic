import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music/http/request_repository.dart';
import 'package:music/routes/app_routes.dart';
import 'package:music/utils/sp_util.dart';
import 'package:music/utils/toast_util.dart';

import '../../../res/r.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Tween<double> _tween;
  late RequestRepository request;

  @override
  void initState() {
    super.initState();
    request = Get.find();
    _tween = Tween(begin: 0, end: 1);
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..drive(_tween);

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInQuart,
    );

    Future.delayed(const Duration(milliseconds: 300), () {
      _controller.forward();
    });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(milliseconds: 300), () {
          ///这里写跳转逻辑
          ///后续还会加入是否登录等判断
          _intentPage();
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff3f3f3),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ///这里是logo
              _buildLogo(),

              ///标题
              _buildTitle(),

              ///描述
              _buildDesc(),
            ],
          ),
        ),
      ),
    );
  }

  _buildLogo() {
    return ScaleTransition(
      scale: _animation,
      child: Image.asset(
        R.images.logo,
      ),
    );
  }

  _buildTitle() {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: Text(
        '云音乐app',
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontFamily: R.fonts.PuHuiTi,
        ),
      ),
    );
  }

  _buildDesc() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Text(
        '您的flutter音乐管家app',
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
          fontFamily: R.fonts.GuFengLiShu,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }

  void _intentPage() {
    if (SpUtil.checkLogin) {
      ///需要刷新一下登录状态看登录是否过期
      request.refreshLogin(
        success: (_) {
          Get.offAllNamed(Routes.index);
        },
        fail: (msg) {
          Get.offAndToNamed(Routes.login);
          ToastUtil.show('登录已过期，请重新登录');
        },
      );
    } else {
      Get.offAndToNamed(Routes.login);
    }
  }
}
