import 'package:flutter_app/ui/pages/movies/home_tab_view.dart';
import 'package:get/get.dart';

import 'splash_state.dart';

class SplashLogic extends GetxController {
  final state = SplashState();

  void checkLogin() async {
    await Future.delayed(Duration(seconds: 2));
    Get.offAll(HomeTabPage());
  }
}
