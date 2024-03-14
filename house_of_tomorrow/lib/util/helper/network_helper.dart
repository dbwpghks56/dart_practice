import 'dart:developer';

import 'package:dio/dio.dart';

abstract class NetworkHelper {
  static final Dio dio = Dio()
    ..interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // 네트워크 요청 전에 실행
        log('REQUEST[${options.method}] => PATH: ${options.path}');
        return handler.next(options);
      },
      onResponse: (response, handler) {
        // 네트워크 응답을 받은 후 실행
        log('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
        return handler.next(response);
      },
      onError: (DioException e, handler) {
        // 에러가 발생했을 때 실행
        log('ERROR[${e.response?.statusCode}] => PATH: ${e.requestOptions.path}');
        return handler.next(e);
      },
    ));
}
