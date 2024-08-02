import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:music/base/controllers/get_state_controller.dart';
import 'package:music/ui/dialog/page_loading.dart';

abstract class GetStateView<C extends GetStateController,S>
    extends StatefulWidget {
  const GetStateView({super.key});

  C get controller => GetInstance().find<C>();

  @protected
  Widget build(BuildContext context, S data);

  @override
  GetStateViewState<C,S> createState() {
    return GetStateViewState<C,S>();
  }
}

class GetStateViewState<C extends GetStateController,S>
    extends State<GetStateView> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.controller.obx(
      (S) => widget.build(context, S),
      onLoading: const PageLoading(),
    );
  }

  @override
  void dispose() {
    Get.delete<C>();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}
