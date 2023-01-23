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

  AuthRepositoryImpl()  {
    //dioClient = GetIt.instance.get();
  }

  @override
  Future<CommonResponse> doLogin({
  String emailId = "",
  String password = ""}) async {
    DioClient dioClient  = await DioClient().init();
    try {
      var jsonBody = {
        "email": emailId,
        "password": password,
      };
      var response = await dioClient.request(
          ApiConstant.login, MethodType.post, jsonBody);

      return CommonResponse.fromJson(response, (json) => response);
    } catch (e) {
      logger.e(e.toString());
      rethrow;
    }
  }
}
