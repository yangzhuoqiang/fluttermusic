import 'package:flutter/material.dart';
import 'package:music/res/style.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:lottie/lottie.dart';
import '../../../res/r.dart';

class RefreshHeader extends StatelessWidget {
  const RefreshHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomHeader(
      builder: (BuildContext context, RefreshStatus? mode) {
        Widget header;
        if (mode == RefreshStatus.idle) {
          ///下拉时显示
          header = const Text(
            '下拉刷新',
            style: Style.b8c0d414,
          );
        } else if (mode == RefreshStatus.refreshing) {
          ///加载中
          header = Lottie.asset(
            R.lottie.refreshHeader,
            width: 100,
            animate: true,
          );
        } else if (mode == RefreshStatus.failed) {
          ///加载失败
          header = const Text(
            '刷新失败',
            style: Style.b8c0d414,
          );
        } else if (mode == RefreshStatus.completed) {
          ///加载成功
          header = const Text(
            '刷新成功',
            style: Style.b8c0d414,
          );
        } else {
          ///超过二层
          header = const Text(
            '释放刷新',
            style: Style.b8c0d414,
          );
        }
        return SizedBox(
          height: 64,
          child: Center(child: header),
        );
      },
    );
  }
}
