import 'package:flutter_app/ui/pages/splash/splash_view.dart';
import 'package:get/get.dart';

import '../ui/pages/movies/home_tab_view.dart';

class RouteConfig {
  ///main page
  static final String splash = "/splash";
  static final String main = "/main";

  static final List<GetPage> getPages = [
    GetPage(name: splash, page: () => SplashPage()),
    GetPage(name: main, page: () => HomeTabPage()),
  ];
}
