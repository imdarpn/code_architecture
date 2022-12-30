import 'package:get/get.dart';
import 'package:getx_structure/pages/login/login_bindings.dart';
import 'package:getx_structure/pages/login/login_view.dart';
import 'package:getx_structure/pages/splash/splash_bindings.dart';
import 'package:getx_structure/pages/splash/splash_view.dart';
part 'app_routes.dart';

class AppPages {
  static const initialRoute = Routes.splash;

  static final routes = [
    GetPage(
        name: _Paths.splash,
        page: () => const SplashView(),
        binding: SplashBindings()),
    GetPage(
        name: _Paths.login, page: () => LoginView(), binding: LoginBindings()),
  ];
}
