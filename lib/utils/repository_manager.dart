import 'package:getx_structure/data/login/login/remote/api/login_api.dart';
import 'package:getx_structure/data/login/login/remote/api/login_api_impl.dart';

import '../data/common/module/dio_client.dart';
import '../data/login/login/repository/login_repository_impl.dart';
import '../domain/login/repository/login_repository.dart';
import '../domain/login/usecase/login_usecase.dart';
import '../main.dart';
import '../presentation/login/bloc/login_bloc.dart';

void setup() async {
  // dio client & interceptor
  sl.registerLazySingleton<DioClient>(() => DioClient().init());

  //datasource
  sl.registerLazySingleton<LoginApi>(() => LoginApiImpl(dioClient: sl()));

  //repositories
  sl.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(loginApi: sl()));

  //use cases
  sl.registerLazySingleton(() => LoginUseCase(loginRepository: sl()));

  //blocs
  sl.registerFactory(() => LoginBloc(
      loginUseCase: sl()
  ));
  
}