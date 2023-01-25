import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:getx_structure/data/common/module/dio_client.dart';
import 'package:getx_structure/data/common/resposne_model/common_response.dart';
import 'package:getx_structure/data/login/login/remote/dto/login_request.dart';
import 'package:getx_structure/domain/login/entity/login_entity.dart';
import 'package:getx_structure/utils/logger_util.dart';

import '../../../../../domain/common/base/base_exception.dart';
import '../../../../../presentation/common/enums/method_type.dart';
import '../../../../common/constants/api_constant.dart';
import '../dto/login_response.dart';
import 'login_api.dart';

class LoginApiImpl implements LoginApi {
  final DioClient dioClient;

  LoginApiImpl({required this.dioClient});

  @override
  Future<LoginEntity> login(LoginRequest loginRequest) async {
    try {

      var response = await dioClient.request(
          ApiConstant.login, MethodType.post, loginRequest.toJson());
      logger.e("RESPOSNE ==== ${response.message}");
      if (response.status == true) {
        LoginResponse loginResponse = LoginResponse.fromJson(response.data);
        return LoginEntity(id: loginResponse.id!,
            name: loginResponse.name!,
            email: loginResponse.email!,
            token: loginResponse.token!);
      } else {
        logger.e("HERE EXCEPTIOPN");
        SnackBar(
          content: Text(response.message,),
        );
        throw BaseException(message: response.message, );
      }
    }on DioError catch(e){
      throw BaseException(message: e.message, code: e.response?.statusCode);
    }on Exception catch(e){

      throw BaseException(message: e.toString());
    }
  }
}
