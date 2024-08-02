import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:music/utils/toast_util.dart';

import '../typedef/function.dart';
import 'http_request.dart';

///核心请求类
class Request {
  ///发起get请求
  ///[path] 请求路径
  ///[parames] 请求参数
  ///[success] 请求成功回调
  ///[fail] 请求失败回调
  ///[baseUrl] 请求域名
  ///[isJson] 是否是json请求
  ///[dialog] 是否显示加载框
  static void get<T>(
    String path, {
    Map<String, dynamic>? parames,
    String? baseUrl,
    bool isJson = false,
    Success<T>? success,
    Fail? fail,
    bool dialog = true,
  }) {
    _request(
      Method.GET,
      path,
      params: parames,
      baseUrl: baseUrl,
      isJson: isJson,
      success: success,
      fail: fail,
      dialog: dialog,
    );
  }

  ///发起post请求只多了一个data参数
  ///[path] 请求路径
  ///[parames] 请求参数
  ///[data] 请求参数
  ///[success] 请求成功回调
  ///[fail] 请求失败回调
  ///[baseUrl] 请求域名
  ///[isJson] 是否是json请求
  ///[dialog] 是否显示加载框
  static void post<T>(
    String path, {
    Map<String, dynamic>? parames,
    dynamic data,
    String? baseUrl,
    bool isJson = false,
    Success<T>? success,
    Fail? fail,
    bool dialog = true,
  }) {
    _request(
      Method.POST,
      path,
      params: parames,
      data: data,
      baseUrl: baseUrl,
      isJson: isJson,
      success: success,
      fail: fail,
      dialog: dialog,
    );
  }

  ///发起请求
  ///[method] 请求方式
  ///[path] 请求路径
  ///[params] 请求参数
  ///[data] 请求体post请求会用到
  ///[baseUrl] 请求基础路径
  ///[isJson] 是否是json请求
  ///[success] 请求成功回调
  ///[fail] 请求失败回调
  ///[dialog] 是否显示加载框
  static void _request<T>(
    Method method,
    String path, {
    Map<String, dynamic>? params,
    dynamic data,
    String? baseUrl,
    bool isJson = false,
    bool dialog = true,
    Success<T>? success,
    Fail? fail,
  }) {
    if (dialog) {
      //显示加载框
      ToastUtil.showLoading();
    }

    HttpRequest.request(
      method,
      path,
      params: params,
      data: data,
      baseUrl: baseUrl,
      isJson: isJson,
      success: (data) {
        if (dialog) {
          //隐藏加载框
          SmartDialog.dismiss(status: SmartStatus.loading);
        }
        if (success != null) {
          success(data);
        }
      },
      fail: (msg) {
        if (dialog) {
          //隐藏加载框
          SmartDialog.dismiss(status: SmartStatus.loading);
        }
        if (fail != null) {
          fail(msg);
        } else {
          ToastUtil.show(msg);
        }
      },
    );
  }
}
