import 'package:dartz/dartz.dart';
import 'package:getx_structure/data/login/login/remote/dto/login_request.dart';
import 'package:getx_structure/domain/login/entity/login_entity.dart';
import 'package:getx_structure/domain/login/repository/login_repository.dart';

import '../../common/base/base_failure.dart';

class LoginUseCase {
  final LoginRepository loginRepository;

  LoginUseCase({required this.loginRepository});

  Future<Either<LoginEntity, Failure>> login(LoginRequest loginRequest) async {
    return await loginRepository.login(loginRequest);
  }

}