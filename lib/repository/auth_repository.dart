import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:getx_structure/api_service/api_constant.dart';
import 'package:getx_structure/api_service/dio_client.dart';
import 'package:getx_structure/common/enums/method_type.dart';
import 'package:getx_structure/models/common_response.dart';
import 'package:getx_structure/utils/logger_util.dart';


abstract class AuthRepository  {
  Future<CommonResponse> doLogin(
      {String emailId, String password});
}

class AuthRepositoryImpl extends AuthRepository {
  late DioClient _dioClient;

  AuthRepositoryImpl() {
    _dioClient = GetIt.instance.get<DioClient>();
  }

  @override
  Future<CommonResponse> doLogin({
  String emailId = "",
  String password = ""}) async {

    try {
      var jsonBody = {
        "email": emailId,
        "password": password,
      };
      var response = await _dioClient.request(
          ApiConstant.login, MethodType.post, jsonBody);

      return CommonResponse.fromJson(response, (json) => response);
    } catch (e) {
      logger.e(e.toString());
      rethrow;
    }
  }
}
