import 'package:get/get.dart';
import 'package:getx_structure/pages/login/login_controller.dart';
import 'package:getx_structure/repository/auth_repository.dart';

class LoginBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(
            () => AuthRepositoryImpl());
    Get.put<LoginController>(LoginController());
  }

}