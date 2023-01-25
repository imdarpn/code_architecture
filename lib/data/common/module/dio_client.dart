import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:getx_structure/data/common/constants/api_constant.dart';

import '../../../domain/common/base/base_exception.dart';
import '../../../models/common_response.dart';
import '../../../presentation/common/enums/method_type.dart';
import '../../../presentation/common/widgets/common_widgets.dart';
import '../interceptor/api_interceptor.dart';


class DioClient extends Service {
  late Dio dio;

  DioClient init() {
    dio = Dio(BaseOptions(baseUrl: ApiConstant.baseUrl))..interceptors.add(ApiInterceptors());
    return this;
  }

  Future<CommonResponse> request(String url, MethodType method, dynamic params) async {
    Response? response;
    try {


      if (await CommonWidgets.checkConnectivity()) {
        if (method == MethodType.post) {
          response = await dio.post(url, data: params);
        } else if (method == MethodType.delete) {
          response = await dio.delete(url);
        } else if (method == MethodType.patch) {
          response = await dio.patch(url);
        } else {
          response = await dio.get(
            url,
            queryParameters: params,
          );
        }

        return CommonResponse.fromJson(response.data, (json) => response!.data);
      } else {
        throw BaseException(message: "No Internet connection", code: response!.statusCode);

      }
    } on DioError catch (dioError) {

      throw BaseException(message: dioError.message, code: dioError.response?.statusCode);
    } catch (error) {
      throw BaseException(message: error.toString());
    }
  }
}



