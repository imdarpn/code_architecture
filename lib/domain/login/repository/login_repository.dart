import 'package:dartz/dartz.dart';
import 'package:getx_structure/domain/login/entity/login_entity.dart';

import '../../../data/login/login/remote/dto/login_request.dart';
import '../../common/base/base_failure.dart';

abstract class LoginRepository {
  Future<Either<LoginEntity, Failure>> login(LoginRequest loginRequest);
}
