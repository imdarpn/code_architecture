import 'dart:convert';

import 'package:get/get.dart';
import 'package:getx_structure/api_service/api_constant.dart';
import 'package:getx_structure/api_service/dio_client.dart';
import 'package:getx_structure/common/enums/method_type.dart';
import 'package:getx_structure/models/common_response.dart';


abstract class AuthRepository  {
  Future<CommonResponse> doLogin(
      {String emailId, String password});
}

class AuthRepositoryImpl extends AuthRepository {
  late DioClient _dioClient;

  AuthRepositoryImpl() {
    _dioClient = Get.find();
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
      rethrow;
    }
  }
}
