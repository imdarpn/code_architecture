import 'package:flutter_app/networks/api_util.dart';
import 'package:flutter_app/repositories/movie_repository.dart';
import 'package:get/get.dart';


class RepositoryBindings implements Bindings {
  @override
  void dependencies() {
    final apiClient = ApiUtil.getApiClient();
    Get.lazyPut<MovieRepository>(
      () => MovieRepositoryImpl(apiClient: apiClient),
      fenix: true,
    );
  }
}
