import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class GetSaveView<T extends GetxController> extends StatefulWidget {
  const GetSaveView({Key? key}) : super(key: key);

  T get controller => GetInstance().find<T>();

  @protected
  Widget build(BuildContext context);

  ///widget生命周期
  get lifecycle => null;

  @override
  GetSaveViewState<T> createState() => GetSaveViewState<T>();
}

class GetSaveViewState<S extends GetxController> extends State<GetSaveView>
    with WidgetsBindingObserver, AutomaticKeepAliveClientMixin<GetSaveView> {
  GetSaveViewState();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.build(context);
  }

  @override
  void initState() {
    super.initState();
    if (widget.lifecycle != null) {
      WidgetsBinding.instance.addObserver(this);
    }
  }

  @override
  void dispose() {
    Get.delete<S>();
    if (widget.lifecycle != null) {
      WidgetsBinding.instance.removeObserver(this);
    }
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (widget.lifecycle != null) {
      widget.lifecycle(state);
    }
  }

  @override
  bool get wantKeepAlive => true;
}
