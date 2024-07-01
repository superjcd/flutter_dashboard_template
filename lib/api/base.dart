import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dashboard_template/router/router.dart';
import 'package:dashboard_template/main.dart';
import 'package:dashboard_template/logger.dart';


class DioService {
  late Dio _dio;
  static final DioService _singleton = DioService._internal();

  factory DioService() {
    return _singleton;
  }

  DioService._internal() {
    initializeDio();
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<void> initializeDio() async {
    final token = await getToken();

    _dio = Dio(
      BaseOptions(
        baseUrl: "http://127.0.0.1:5050",
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 3),
        headers: {
          if (token != null) 'Authorization': 'Bearer $token',
        },
      ),
    );
   

    _dio.interceptors.addAll([
      LoggerInterceptor(),
      UnAuthorizedInterceptor()
    ]);
  }

  Future<Response> get(String url, {Map<String, dynamic>? params}) async {
    return _dio.get(url, queryParameters: params);
  }

  Future<Response> post(String url, {Map<String, dynamic>? data}) async {
    return _dio.post(url, data: data);
  }

}


class LoggerInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final options = err.requestOptions;
    final requestPath = '${options.baseUrl}${options.path}';
    logger.e('${options.method} request => $requestPath');
    logger.d('Error: ${err.error}, Message: ${err.message}');

    return super.onError(err, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final requestPath = '${options.baseUrl}${options.path}';
    logger.i('${options.method} request => $requestPath');
    return super.onRequest(options, handler);
  }

  // @override
  // void onResponse(Response response, ResponseInterceptorHandler handler) {
  //   logger.d('StatusCode: ${response.statusCode}, Data: ${response.data}');
  //   return super.onResponse(response, handler);
  // }
}

class UnAuthorizedInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final options = err.requestOptions;
    if (err.response!.statusCode == 401) {
         if (options.path.endsWith("login")) {
            scaffoldMessengerKey.currentState!.showSnackBar(
                const SnackBar(content: Text("登录信息错误, 请重试"))
                );
            return;
         }else {
            scaffoldMessengerKey.currentState!.showSnackBar(
                const SnackBar(content: Text("Token过期, 请重新登录"))
                );
            const LoginRoute().go(rootNavigatorKey.currentContext!);
            return;
         }
    }
    return super.onError(err, handler);
  }
}