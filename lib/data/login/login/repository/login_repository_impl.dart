import 'package:dartz/dartz.dart';
import 'package:getx_structure/utils/logger_util.dart';

import '../../../../domain/common/base/base_exception.dart';
import '../../../../domain/common/base/base_failure.dart';
import '../../../../domain/login/entity/login_entity.dart';
import '../../../../domain/login/repository/login_repository.dart';
import '../remote/api/login_api.dart';
import '../remote/dto/login_request.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginApi loginApi;

  LoginRepositoryImpl({ required this.loginApi });

  @override
  Future<Either<LoginEntity, Failure>> login(LoginRequest loginRequest) async {
    try{
      var result = await loginApi.login(loginRequest);
      return Left(result);
    } on BaseException catch(e){
      logger.e("message  repo ${e.message}");
      return Right(BaseFailure(message: e.message, code: e.code!));
      // String errorMessage = ErrorMapper.getErrorMessage(e.httpStatusCode);
      // return Right(Failure(message: errorMessage));
    }

  }
  
}
