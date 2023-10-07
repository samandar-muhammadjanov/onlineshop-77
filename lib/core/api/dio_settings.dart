import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:onlineshop_77/assets/constants/constants.dart';
import 'package:onlineshop_77/core/api/token_refresh_interceptor.dart';

class DioSettings {
  BaseOptions _dioBaseOptions = BaseOptions(
    baseUrl: AppConstants.baseUrl,
    connectTimeout: const Duration(milliseconds: 35000),
    receiveTimeout: const Duration(milliseconds: 33000),
    followRedirects: false,
    headers: {'Accept-Language': 'uz'},
    validateStatus: (status) => status != null && status <= 500,
  );

  void setBaseOptions({String? lang}) {
    _dioBaseOptions = BaseOptions(
      baseUrl: AppConstants.baseUrl,
      connectTimeout: const Duration(milliseconds: 35000),
      receiveTimeout: const Duration(milliseconds: 33000),
      followRedirects: false,
      headers: {'Accept-Language': lang},
      validateStatus: (status) => status != null && status <= 500,
    );
  }

  Dio get dio {
    final dio = Dio(_dioBaseOptions);
    dio.interceptors
      ..add(TokenRefreshInterceptor(dio: dio, baseUrl: AppConstants.baseUrl))
      ..add(LogInterceptor(
        responseBody: true,
        requestBody: true,
        request: true,
        requestHeader: true,
        logPrint: (object) => log(object.toString()),
      ));
    return dio;
  }
}
