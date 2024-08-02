import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class GetCommonView<T extends GetxController> extends StatelessWidget {
  const GetCommonView({Key? key}) : super(key: key);

  final String? tag = null;

  T get controller => GetInstance().find<T>(tag: tag);
  @protected
  Widget buildWidget(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<T>(
      builder: (controller) {
        return buildWidget(context);
      },
    );
  }
}
