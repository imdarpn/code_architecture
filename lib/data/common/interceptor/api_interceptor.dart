import 'dart:convert';
import 'dart:io' show Platform;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:getx_structure/data/common/constants/api_constant.dart';
import 'package:getx_structure/utils/logger_util.dart';

class ApiInterceptors extends InterceptorsWrapper {

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final method = options.method;
    final uri = options.uri;
    final data = options.data;


    if (options.uri.toString().contains("login") ||
        options.uri.toString().contains(("socialSignupCheck")) ||
        options.uri.toString().contains(("signup")) ||
        options.uri.toString().contains(("forgotPassword"))) {
      options.headers['auth_token'] = '${Constants.defaultToken}';
    } else {

    }

    if (options.uri.toString().contains('user/refreshToken')) {
      options.headers['refresh_token'] = Constants.refreshToken;
    }
    options.headers['language'] = 'en';
    options.headers['device_id'] = Constants.deviceId;
    options.headers['device_type'] = Platform.isAndroid ? "android" : "ios";
    if (method == 'GET') {
      logger.log("✈️ REQUEST[$method] => PATH: $uri \n Token: ${options.headers}", printFullText: true);
    } else {
      try {
        logger.log("✈️ REQUEST[$method] => PATH: $uri \n Token:${options.headers} \n DATA: ${jsonEncode(data)}",
            printFullText: true);
      } catch (e) {
        logger.log("✈️ REQUEST[$method] => PATH: $uri \n Token: ${options.headers} \n DATA: $data",
            printFullText: true);
      }
    }
    super.onRequest(options, handler);
  }


  @override
    Future<void> onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    final statusCode = response.statusCode;
    final uri = response.requestOptions.uri;
    final data = jsonEncode(response.data);
    logger.log("✅ RESPONSE[$statusCode] => PATH: $uri\n DATA: $data",
        printFullText: true);


    //handle error state
    if (response.data["code"] == 0) {
      EasyLoading.dismiss();

    } else {
      super.onResponse(response, handler);
    }
    //Handle section expired
  }

  @override
    Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    final statusCode = err.response?.statusCode!;
    final uri = err.requestOptions.path;
    var data = "";
    try {
      data = jsonEncode(err.response!.data);

    } catch (e) {}
    logger.log("⚠️ ERROR[$statusCode] => PATH: $uri\n DATA: $data",
        printFullText: true);
    super.onError(err, handler);
  }


}
