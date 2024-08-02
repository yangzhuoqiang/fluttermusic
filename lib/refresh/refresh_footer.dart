import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../res/r.dart';
import '../res/style.dart';

class RefreshFooter extends StatelessWidget {
  const RefreshFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomFooter(
      builder: (BuildContext context, LoadStatus? mode) {
        Widget footer;
        if (mode == LoadStatus.idle) {
          ///下拉提示
          footer = const Text(
            '上拉加载',
            style: Style.b8c0d414,
          );
        } else if (mode == LoadStatus.loading) {
          ///加载中
          footer = Lottie.asset(
            R.lottie.refreshFooter,
            width: 200,
            animate: true,
          );
        } else if (mode == LoadStatus.failed) {
          ///加载失败
          footer = const Text(
            '加载失败',
            style: Style.b8c0d414,
          );
        } else {
          ///无更多数据
          footer = const Text(
            '没有更多数据',
            style: Style.b8c0d414,
          );
        }
        return SizedBox(
          height: 60,
          child: Center(child: footer),
        );
      },
    );
  }
}
