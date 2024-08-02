import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:music/ui/dialog/dialog.dart';

class ToastUtil {
  static void show(String msg) {
    SmartDialog.showToast(msg);
  }

  static void showLoading([String? msg]) {
    SmartDialog.showLoading(
      backDismiss: false,
      animationType: SmartAnimationType.scale,
      builder: (_) => LoadingDialog(text: msg),
    );
  }
}
