import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:music/utils/toast_util.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageUtils {
  static Future<void> saveImage(String url) async {
    try {
      if (!url.startsWith('http')) throw '保存失败，图片不存在！';

      /// 权限检测
      PermissionStatus storageStatus = await Permission.storage.status;
      if (storageStatus != PermissionStatus.granted) {
        storageStatus = await Permission.storage.request();
        if (storageStatus != PermissionStatus.granted) {
          throw '无法存储图片，请先授权！';
        }
      }

      var resp = await Dio().get(
        url,
        options: Options(responseType: ResponseType.bytes),
      );

      final result = await ImageGallerySaver.saveImage(
        Uint8List.fromList(resp.data),
      );

      if (result['isSuccess'] == true) {
        ToastUtil.show('保存成功！');
      } else {
        throw result['errorMessage'];
      }
    } catch (e) {
      ToastUtil.show(e.toString());
    }
  }
}
