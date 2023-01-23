

import 'package:get_it/get_it.dart';
import 'package:getx_structure/api_service/dio_client.dart';
import 'package:getx_structure/repository/auth_repository.dart';

final getIt = GetIt.instance;

void setup() async {

  //getIt.registerFactoryParam((param1, param2) => null)<DioClient>(() => DioClient().init());
  getIt.registerLazySingleton<AuthRepository>(
          () => AuthRepositoryImpl());
}