import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:getx_structure/api_service/api_constant.dart';
import 'package:getx_structure/api_service/api_interceptor.dart';
import 'package:getx_structure/common/enums/method_type.dart';
import 'package:getx_structure/common/widgets/common_widgets.dart';


class DioClient extends Service {
  late Dio dio;
  late DioClient dioClient;

  Future<DioClient> init() async {
    dio = Dio(BaseOptions(baseUrl: ApiConstant.baseUrl))..interceptors.add(ApiInterceptors());
    return this;
  }

  Future<Map<String, dynamic>> request(String url, MethodType method, dynamic params) async {
    try {

      Response response;
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

        return response.data;
      } else {
        return {
          "message":"No Internet connection",
          "status" : false
        };
      }
    } on DioError catch (dioError) {
      return {
        "message":dioError.response?.data["message"],
        "status" : false
      };
    } catch (error) {
      return {
        "message":error.toString(),
        "status" : false
      };
    }
  }
}



