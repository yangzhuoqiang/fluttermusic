import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:music/http/http_exception.dart';
import 'package:music/http/request_api.dart';
import 'package:music/utils/sp_util.dart';
import 'package:music/utils/toast_util.dart';

import '../typedef/function.dart';

///超时时间
const int connectTimeOut = 10000;

///接受超时时间
const int receiveTimeOut = 10000;

///发送超时时间
const int sendTimeOut = 10000;

class HttpRequest {
  static Dio? _dio;

  static Dio createInstance([bool isJson = false]) {
    if (_dio == null) {
      var opt = BaseOptions(
        contentType: isJson
            ? Headers.jsonContentType
            : Headers.formUrlEncodedContentType,
        validateStatus: (status) {
          return true;
        },
        sendTimeout: sendTimeOut,
        receiveTimeout: receiveTimeOut,
        connectTimeout: connectTimeOut,
        baseUrl: RequestApi.BASE_URL,
      );
      _dio = Dio(opt);
    }
    _dio?.options.contentType =
        isJson ? Headers.jsonContentType : Headers.formUrlEncodedContentType;
    return _dio!;
  }

  ///请求方法
  static Future request<T>(
    Method method,
    String path, {
    Map<String, dynamic>? params,
    dynamic data,
    String? baseUrl,
    bool isJson = false,
    Success? success,
    Fail? fail,
  }) async {
    try {
      var connectResult = await (Connectivity().checkConnectivity());
      if (connectResult == ConnectivityResult.none) {
        ToastUtil.show("网络连接失败，请检查网络");
        return;
      }
      Dio dio = createInstance(isJson);
      if (baseUrl != null) {
        dio.options.baseUrl = baseUrl;
      }
      if (SpUtil.checkLogin) {
        if (params == null) {
          params = {'cookie': SpUtil.cookie};
        } else {
          params['cookie'] = SpUtil.cookie;
        }
      }

      Response resp = await dio.request(
        path,
        data: data,
        queryParameters: params,
        options: Options(
          method: _methodValues[method],
        ),
      );
      if (success != null) {
        success(resp.data);
      }
    } on DioError catch (e) {
      String msg = HttpException.handleException(e);
      if (fail != null) {
        fail(msg);
      }
    }
  }
}

///请求类型枚举
///这里只用到了get和post
enum Method {
  GET,
  POST,
}

///请求类型值
const _methodValues = {
  Method.GET: 'get',
  Method.POST: 'post',
};
